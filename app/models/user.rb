class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
  has_many :bookmarks
  has_many :likes
  has_many :liked_bookmarks, through: :likes, source: :bookmark

  def self.from_omniauth(auth)
    user = find_by(email: auth.info.email) || find_by(provider: auth.provider, uid: auth.uid) || new
    user.provider = auth.provider
    user.uid = auth.uid
    user.email = auth.info.email

    unless user.persisted?
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
    end

    user.save
    user
  end

  def liked(bookmark)
    likes.where(bookmark_id: bookmark.id).first
  end
end
