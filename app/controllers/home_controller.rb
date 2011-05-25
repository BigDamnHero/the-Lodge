class HomeController < ApplicationController

  def index
    
  end
  
  def misc
    require_user  
  end

end
