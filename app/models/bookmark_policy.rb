class BookmarkPolicy
  attr_reader :user, :bookmark

  def initialize(user, bookmark)
    @user = user
    @bookmark = bookmark
  end

  def create?
    user.present?
  end

  def destroy?
    user == bookmark.user
  end
end
