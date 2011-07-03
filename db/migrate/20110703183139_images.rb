class Images < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.integer   :instance_id
      t.string    :class_name
      t.string    :gender
      t.boolean   :is_primary
      t.string    :image_url
      t.string    :thumb_url
    end
    
    add_index(:images, :instance_id)
    add_index(:images, :class_name)
    add_index(:images, :gender)
    add_index(:images, :is_primary)
  end

  def self.down
    remove_index :images, :is_primary
    remove_index :images, :gender
    remove_index :images, :class_name
    remove_index :images, :instance_id
    drop_table :images
  end
end
