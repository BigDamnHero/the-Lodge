class CreatureBase < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :race
  
  def classes_str
    classes = ""
    for level in class_levels
      classes << ", " if classes.length > 0
      classes << level.character_class.name + " " + level.level.to_s
    end
    classes
  end
  
end
