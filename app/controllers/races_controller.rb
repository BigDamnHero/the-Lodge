class RacesController < ApplicationController

  before_filter :require_admin
    
  # GET /characters
  # GET /characters.xml
  def index
    @races = Race.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @races }
    end
  end
  
  # GET /characters/1
  # GET /characters/1.xml
  def show
    @race = Race.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @race }
    end
  end

  # GET /characters/new
  # GET /characters/new.xml
  def new
    @race = Race.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @race }
    end
  end

  # POST /races
  # POST /races.xml
  def create
    @race = Race.new(params[:race])
    
    if @race.save
      redirect_to(races_url, :notice => 'Created new race.')
    else
      render(:action => 'new', :notice => 'Error: could not create new race.')
    end
  end
  
  # DELETE /races/1
  # DELETE /races/1.xml
  def destroy
    @race = Race.find(params[:id])
    @race.destroy
    
    respond_to do |format|
      format.html { redirect_to(races_url) }
      format.xml  { head :ok }
    end
  end
  
  
  def starting_with
    @races = Race.where("name like ?", params[:text] << '%').order("name").limit(5)
    @values = []
    for @race in @races
      @values << { :id => @race.id, :name => @race.name }
    end
    
    respond_to do |format|
      format.js   { render :json => @values }
      format.xml  { render :xml => @values }
    end
  end
  
end
