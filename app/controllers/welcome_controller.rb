class WelcomeController < ApplicationController
  def index
    @topics = Topic.all.paginate(page: params[:page], per_page: 5)
    @bookmark = Bookmark.new
  end

  def about
  end
end
