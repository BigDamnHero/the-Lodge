class ClassLevel < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :character_class

end
