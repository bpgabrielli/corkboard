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

  def sanitize_url
    self.url.chomp
  end

  def save_sanitized_with_preview
    self.sanitize_url
    self.retrieve_preview
    self.save
  end
end