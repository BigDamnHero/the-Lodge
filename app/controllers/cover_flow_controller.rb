class CoverFlowController < ApplicationController

  before_filter :require_user
  
  def races
    @races = Race.order(:name);
    @values = []
    for @race in @races
      @values << { :id => @race.id, :name => @race.name, 
                   :image => image_url_path(@race.class.name, @race.id), 
                   :thumb => thumb_url_path(@race.class.name, @race.id) }
    end
    
    respond_to do |format|
      format.js   { render :json => @values }
      format.xml  { render :xml  => @values }
    end
  end
  
  def race
    @race = Race.find(params[:race_id])
    
    respond_to do |format|
      format.js   { render :content_type => 'text/javascript' } #{ render :json => @details }
      format.xml  { render :xml  => @race }
    end
  end
  
  def char_classes
    @char_classes = CharacterClass.order(:name);
    @values = []
    for @c in @char_classes
      @values << { :id => @c.id, :name => @c.name, 
                   :image => image_url_path(@c.class.name, @c.id), 
                   :thumb => thumb_url_path(@c.class.name, @c.id) }
    end
    
    respond_to do |format|
      format.js   { render :json => @values }
      format.xml  { render :xml  => @values }
    end
  end
  
  def char_class
    @c = CharacterClass.find(params[:id])
    
    respond_to do |format|
      format.js   # char_class.js.erb
      format.xml  { render :xml => @c }
    end
  end
  
end
