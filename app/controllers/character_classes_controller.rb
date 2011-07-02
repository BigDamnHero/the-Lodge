class CharacterClassesController < ApplicationController

  before_filter :require_admin
  
  # GET /character_classes
  # GET /character_classes.xml
  def index
    @classes = CharacterClass.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @classes }
    end
  end
  
  # GET /character_classes/1
  # GET /character_classes/1.xml
  def show
    @class = CharacterClass.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @class }
    end
  end

  # GET /character_classes/new
  # GET /character_classes/new.xml
  def new
    @c = CharacterClass.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @c }
    end
  end

  # POST /character_classes
  # POST /character_classes.xml
  def create
    @c = CharacterClass.new(params[:character_class])
    
    if @c.save
      redirect_to(character_classes_url, :notice => 'Created new class.')
    else
      render(:action => 'new', :notice => 'Error: could not create new class.')
    end
  end
  
  def edit
    @c = CharacterClass.find(params[:id])
    
    respond_to do |format|
      format.html # edit.html.erb
      format.xml  { render :xml => @c }
    end
  end
  
  def update
    @c = CharacterClass.find(params[:id])
   
    respond_to do |format|
      if @c.update_attributes(params[:character_class])
        format.html { redirect_to(character_classes_url, :notice => @c.name + ' updated successfully.') }
        format.xml  { head :ok }
      else
        format.html { render :action => 'edit' }
        format.xml  { render :xml => @c.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /character_classes/1
  # DELETE /character_classes/1.xml
  def destroy
    @class = CharacterClass.find(params[:id])
    @class.destroy
    
    respond_to do |format|
      format.html { redirect_to(character_classes_url) }
      format.xml  { head :ok }
    end
  end
  
  
  def starting_with
    @classes = [] #CharacterClass.starting_with(params[:text])
    @values = []
    for @class in @classes
      @values << { :id => @class.id, :name => @class.name, :description => @class.description }
    end
    
    respond_to do |format|
      format.js   { render :json => @values }
      format.xml  { render :xml => @values }
    end
  end
  
end
