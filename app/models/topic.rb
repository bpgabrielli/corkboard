class Topic < ActiveRecord::Base
  has_many :bookmarks

  def self.find_or_initialize_or_default_by(hash)
    if hash[:name].blank?
      Topic.first
    else
      self.find_or_initialize_by(hash)
    end
  end
end
