class ImagesController < ApplicationController
  @@blankImage = File.join(Rails.root, '/public/images/unknown.jpg')
  @@blankThumb = File.join(Rails.root, '/public/images/unknown_thumb.jpg')
  
  def image
    image = Image.primary_image_for(params[:type], params[:id], params[:gender])
    if image
      redirect_to image.image_url
    else
      send_file @@blankImage
    end
  end
  
  def thumb
    image = Image.primary_image_for(params[:type], params[:id], params[:gender])
    if image
      redirect_to image.thumb_url
    else
      send_file @@blankThumb
    end
  end
  
end
