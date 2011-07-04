class CreateCharacterClasses < ActiveRecord::Migration
  def self.up
    create_table :character_classes do |t|
      t.string    :name
      t.string    :description
      t.string    :role
      t.string    :alignment
      t.integer   :hit_die
      t.integer   :user_id
      
      t.timestamps
    end
    
    create_table :class_levels do |t|
      t.integer   :character_id
      t.integer   :class_id
      t.integer   :level

      t.timestamps
    end
    
    add_index(:character_classes, :name, :unique => true)
    add_index(:class_levels, [:character_id, :class_id], :unique => true)
  end

  def self.down
    remove_index :class_levels, :column => [:character_id, :class_id]
    remove_index :character_classes, :name
    
    drop_table :class_levels
    drop_table :character_classes
  end
end
