class Bookmark < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  has_many :likes
  has_many :liking_users, through: :likes, source: :user
  before_save :default_value

  def retrieve_preview
    preview = Preview.new(self.url)
    self.title = preview.title
    self.thumbnail = preview.thumbnail
    self.description = preview.description
  end

  def default_value
    self.topic ||= Topic.first
  end
end