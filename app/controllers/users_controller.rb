class UsersController < ApplicationController

    before_filter :require_admin, :only => [:index, :create, :destroy]
    before_filter :require_self, :only => [:show, :edit, :update]

  # GET /users
  # GET /users.xml
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])
    # todo: generate reasonably secure random passwords
    @user.password = "qweprojisa2398dsl"
    @user.password_confirmation = "qweprojisa2398dsl"
    
    # Save without session maintenance to skip auto-login, since we require
    # activation first.
    if @user.save_without_session_maintenance
      @user.send_registration_instructions!
      redirect_to(users_url, :notice => 'Invitation sent.')
    else
      render(:action => 'new', :notice => 'There was an error creating the invitation.')
    end
  end
  
  # GET /register
  def register
    if User.count <= 0
      # Allow an initial admin user to be created
      @user = User.new
    else
      @user = User.find_using_perishable_token(params[:invite_code]) || (raise Exception)
      @user.password = ''
      raise Exception if @user.active?
    end
  end

  # POST /register
  def submit_registration
    if User.count < 1
      register_admin
    else
      @user = User.find_using_perishable_token(params[:invite_code]) || (raise Exception)
      raise Exception if @user.active?
      
      # Save without session maintenance to skip auto-login, since we require
      # activation first.
      if @user.update_attributes(params[:user])
        @user.send_activation_instructions!
        redirect_to(:root, :notice => 'Registration successful!  Please check your email for instructions to activate your account.')
      else
        render(:action => 'register', :notice => 'There was an error registering your account.')
      end
    end
  end

  def register_admin
    @user = User.new(params[:user])
    @user.roles = [Role::ADMIN]
    if @user.save
      @user.activate!
      redirect_to(users_url, :notice => 'Admin user created.')
    else
      render(:action => 'new', :notice => 'There was an error creating the admin user.')
    end
  end

  def activate
    @user = User.find_using_perishable_token(params[:activation_code], 1.week) || (raise Exception)
    
    raise Exception if @user.active?
    
    if @user.activate!
      UserSession.create(@user, false)
      @user.send_activation_confirmation!
      redirect_to(:root, :notice => 'Welcome to the Lodge!')
    else
      render :action => :new
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(users_url, :notice => 'User has been updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def require_self
    require_user
    if current_user && !is_admin
        params[:id] = current_user.id
    end
  end
end
