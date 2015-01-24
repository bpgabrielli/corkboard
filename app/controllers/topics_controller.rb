class TopicsController < ApplicationController
  def index
    @topics = Topic.all.paginate(page: params[:page], per_page: 5)
  end

  def show
    @topic = Topic.find(params[:id])
    @bookmarks = @topic.bookmarks.paginate(page: params[:page], per_page: 8)
  end
end
