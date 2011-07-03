class Character < CreatureBase
  include ::HasImages
  
  belongs_to  :race
  has_many    :images, :conditions => {:class_name => 'Character'}, 
              :foreign_key => 'instance_id', :dependent => :destroy
  
  has_many    :class_levels, :dependent => :destroy
  accepts_nested_attributes_for   :class_levels, :allow_destroy => true
end
