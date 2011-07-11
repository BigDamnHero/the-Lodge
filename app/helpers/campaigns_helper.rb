module CampaignsHelper

  def gm?(campaign)
    campaign.campaign_members.where(:user_id => current_user).where(:role => [CampaignRole::GM, CampaignRole::ASST_GM]).exists?
  end

end
