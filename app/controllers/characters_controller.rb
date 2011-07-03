class CharactersController < ApplicationController

  before_filter :require_user
    
  # GET /characters
  # GET /characters.xml
  def index
    @characters = current_user.characters
    #@characters = Character.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @characters }
    end
  end
  
  # GET /characters/1
  # GET /characters/1.xml
  def show
    @character = current_user.characters.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @character }
    end
  end

  # GET /characters/new
  # GET /characters/new.xml
  def new
    @character = Character.new
    #@character.class_levels << ClassLevel.new({ :user_id => 0, :class_id => 0, :level => 1 })
    #@character.class_levels << ClassLevel.new({ :user_id => 0, :class_id => 1, :level => 1 })
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @character }
    end
  end

  def create
    params[:character][:class_levels] = [ClassLevel.new({:user => current_user, :class_id => params[:class_id], :level => 1})]
    params[:character][:user] = current_user
    @character = Character.new(params[:character])
    print "Image params: " + params[:image].to_s
    if @character.save
      @character.add_image(params[:image])
      redirect_to(characters_url, :notice => 'Your character has been created.')
    else
      render(:action => 'new', :notice => 'Error: could not create character.')
    end
  end
  
  def destroy
    @character = Character.find(params[:id])
    @character.destroy
    
    respond_to do |format|
      format.html { redirect_to(characters_url) }
      format.xml  { head :ok }
    end
  end
end
