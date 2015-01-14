class WelcomeController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end

  def about
  end
end
