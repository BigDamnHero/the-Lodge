class Image < ActiveRecord::Base
  
  def self.primary_image_for(class_name, instance_id, gender = nil)
    if gender
      images = Image.where("class_name = ? and instance_id = ? and gender = ? and is_primary = ?",
                  class_name, instance_id, gender, true).limit(1)
    else
      images = Image.where("class_name = ? and instance_id = ? and is_primary = ?",
                  class_name, instance_id, true).limit(1)
    end
    images.length > 0 ? images[0] : nil
  end
  
  def self.any_primary_image(class_name, instance_id)
    images = Image.where("class_name = ? and instance_id = ? and is_primary = ?",
                         class_name, instance_id, true)
    images.length > 0 ? images[0] : nil
  end
  
  def self.any_image(class_name, instance_id)
    images = Image.where("class_name = ? and instance_id = ?", class_name, instance_id)
    images.length > 0 ? images[0] : nil
  end
  
end
