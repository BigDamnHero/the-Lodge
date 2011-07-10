class Campaign < ActiveRecord::Base
  has_many  :campaign_members
  has_many  :characters, :through => :campaign_members
  has_many  :users, :through => :campaign_members
  belongs_to  :user
  
  accepts_nested_attributes_for :campaign_members
  
  def add_player(user, role, character = nil)
    cm = CampaignMember.new
    cm.user = user
    cm.role = role
    cm.character = character
    self.campaign_members << cm
  end
  
  def invite_players!(users)
    users.each do |u|
      # if a player is already a campaign member (role doesn't matter), don't
      # invite again.
      exists = self.campaign_members.where("user_id" => u.id).exists?
      add_player(u, CampaignRole::INVITED) unless exists
    end
  end
end
