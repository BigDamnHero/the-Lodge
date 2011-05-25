class CreateCreatureBases < ActiveRecord::Migration
  def self.up
    create_table :creature_bases do |t|
      t.integer   :user_id
      t.string    :name
      t.text      :description
      t.integer   :race_id
      
      t.integer   :str
      t.integer   :dex
      t.integer   :con
      t.integer   :int
      t.integer   :wis
      t.integer   :cha
      
      t.integer   :max_hp
      t.integer   :current_hp
      
      t.timestamps
    end
  end

  def self.down
    drop_table :creature_bases
  end
end
