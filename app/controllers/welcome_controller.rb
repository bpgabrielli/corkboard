class WelcomeController < ApplicationController
  def index
    @topics = Topic.all.paginate(page: params[:page], per_page: 5)
    @bookmark = Bookmark.new
  end

  def create
    @bookmark_new = current_user.bookmarks.build(params.require(:bookmark).permit(:url, :title))
    @topic_bookmark_new = Topic.find_or_initialize_by(name: params[:topic_name])
    @bookmark_new.topic = @topic_bookmark_new
    @bookmark_new.retrieve_preview
    if @bookmark_new.save
      redirect_to :back
    else
      flash[:error] = "Error creating bookmark. Please try again."
      render :back
    end
  end

  def about
  end
end
