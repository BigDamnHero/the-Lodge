class Character < CreatureBase
  belongs_to  :race
  
  has_many    :class_levels, :dependent => :destroy
  accepts_nested_attributes_for   :class_levels, :allow_destroy => true
end
