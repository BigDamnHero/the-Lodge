class CharacterClass < ActiveRecord::Base
  include ::HasImages
  
  has_many    :images, :conditions => {:class_name => 'CharacterClass'}, 
              :foreign_key => 'instance_id', :dependent => :destroy
end
