class Race < ActiveRecord::Base

  def self.starting_with(str, limit = 5)
    Race.where("name like ?", str << '%').order("name").limit(limit)
  end

end
