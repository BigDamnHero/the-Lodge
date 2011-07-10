class CampaignsController < ApplicationController
  before_filter :require_user
  
  
  # GET /campaigns
  # GET /campaigns.xml
  def index
    #@campaigns = current_user.campaigns
    @cms = current_user.campaign_members
    @campaigns_gm = []
    @campaigns_player = []
    @cms.each do |cm|
      if cm.role == CampaignRole::PLAYER
        @campaigns_player << cm.campaign
      else
        @campaigns_gm << cm.campaign
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @campaigns }
    end
  end

  # GET /campaigns/1
  # GET /campaigns/1.xml
  def show
    @campaign = Campaign.find(params[:id])
    @gms = @campaign.campaign_members.where(:role => CampaignRole::GM)
    @assts = @campaign.campaign_members.where(:role => CampaignRole::ASST_GM)
    @players = @campaign.campaign_members.where(:role => CampaignRole::PLAYER)
    @invites = @campaign.campaign_members.where(:role => CampaignRole::INVITED)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @campaign }
    end
  end

  # GET /campaigns/new
  # GET /campaigns/new.xml
  def new
    @campaign = Campaign.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @campaign }
    end
  end

  # GET /campaigns/1/edit
  def edit
    @campaign = Campaign.find(params[:id])
  end

  # POST /campaigns
  # POST /campaigns.xml
  def create
    @campaign = Campaign.new(params[:campaign])
    @campaign.user_id = current_user.id

    respond_to do |format|
      if @campaign.save
        format.html { redirect_to(:campaigns, :notice => 'Campaign was successfully created.') }
        format.xml  { render :xml => @campaign, :status => :created, :location => @campaign }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @campaign.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /campaigns/1
  # PUT /campaigns/1.xml
  def update
    @campaign = Campaign.find(params[:id])

    respond_to do |format|
      if @campaign.update_attributes(params[:campaign])
        format.html { redirect_to(@campaign, :notice => 'Campaign was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @campaign.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /campaigns/1
  # DELETE /campaigns/1.xml
  def destroy
    @campaign = Campaign.find(params[:id])
    @campaign.destroy

    respond_to do |format|
      format.html { redirect_to(campaigns_url) }
      format.xml  { head :ok }
    end
  end
  
  # GET /campaigns/1/invite
  def invite
    @users = User.all
    @campaign = Campaign.find(params[:id])
    respond_to do |format|
      format.html { render :layout => !request.xhr? }
    end
  end
  
  # POST /campaigns/1/invite
  def send_invite
    @campaign = Campaign.find(params[:id])
    @users = User.find(params[:users])
    @campaign.invite_players!(@users)
    respond_to do |format|
      format.html { redirect_to @campaign, :notice => "Invitations have been sent." }
    end
  end
end
