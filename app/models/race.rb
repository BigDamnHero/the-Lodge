class Race < ActiveRecord::Base
  include ::HasImages
  
  has_many    :images, :conditions => {:class_name => 'Race'}, 
              :foreign_key => 'instance_id', :dependent => :destroy
  
  def self.starting_with(str, limit = 5)
    Race.where("name like ?", str << '%').order("name").limit(limit)
  end

end
