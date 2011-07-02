class CreateRaces < ActiveRecord::Migration
  def self.up
    create_table :races do |t|
      t.string    :name
      t.text      :description
      t.text      :physical_description
      t.text      :society
      t.text      :relations
      t.text      :philosophy
      t.text      :adventurers
      t.text      :names
      t.text      :male_names
      t.text      :female_names
      t.string    :image_url
      t.string    :thumb_url
      
      t.timestamps
    end
    
    add_index(:races, :name, :unique => true)
  end

  def self.down
    remove_index :races, :name
    drop_table :races
  end
end
