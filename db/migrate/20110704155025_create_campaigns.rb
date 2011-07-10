class CreateCampaigns < ActiveRecord::Migration
  def self.up
    create_table :campaigns do |t|
      t.string  :name, :null => false
      t.string  :description
      t.text    :summary
      t.integer :user_id, :null => false

      t.timestamps
    end
    add_index :campaigns, :user_id
    
    create_table :campaign_members do |t|
      t.integer :campaign_id, :null => false
      t.integer :user_id, :null => false
      t.integer :character_id
      t.integer :role, :null => false
    end
    add_index :campaign_members, :campaign_id
    add_index :campaign_members, :user_id
    add_index :campaign_members, :character_id
  end

  def self.down
    remove_index  :campaign_members, :character_id
    remove_index  :campaign_members, :user_id
    remove_index  :campaign_members, :campaign_id
    drop_table    :campaign_members
    
    remove_index  :campaigns, :user_id
    drop_table    :campaigns
  end
end
