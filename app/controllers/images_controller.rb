class ImagesController < ApplicationController
  @@blankImage = File.join(Rails.root, '/public/images/unknown.jpg')
  @@blankThumb = File.join(Rails.root, '/public/images/unknown_thumb.jpg')
  
  def image
    image = best_match_image(params[:type], params[:id], params[:gender])
    if image
      redirect_to image.image_url
    else
      send_file @@blankImage
    end
  end
  
  def thumb
    image = best_match_image(params[:type], params[:id], params[:gender])
    if image
      redirect_to image.thumb_url
    else
      send_file @@blankThumb
    end
  end
  
  private
  
  def best_match_image(class_name, instance_id, gender)
    # TODO: this needs to be optimized.  Currently, 5 db calls to realize there
    # are no images associated with an object.  Should probably get all images
    # and iterate to find the best match, rather than making extra db calls.
    image = nil
    fallbacks = gender_seq(gender)
    fallbacks.each do |g|
      image = Image.primary_image_for(class_name, instance_id, g) unless image
    end
    image = Image.any_primary_image(class_name, instance_id) unless image
    image = Image.any_image(class_name, instance_id) unless image
    image
  end
  
  def gender_seq(first)
    case first
      when "male"
        ["male", nil, "female"]
      when "female"
        ["female", nil, "male"]
      else
        [nil]
    end
  end
  
end
