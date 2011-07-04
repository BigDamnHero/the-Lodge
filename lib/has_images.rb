module HasImages

  def add_image(params)
    image = Image.new(params)
    image.instance_id = self.id
    image.class_name = self.class.name
    image.save
  end
  
end
