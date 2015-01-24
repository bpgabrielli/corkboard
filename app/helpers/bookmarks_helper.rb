module BookmarksHelper
  def can_delete?(bookmark)
    current_user == bookmark.user
  end
end
