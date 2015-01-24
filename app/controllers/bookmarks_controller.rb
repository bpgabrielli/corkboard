class BookmarksController < ApplicationController

  def index
    @bookmarks = Bookmark.all
    @bookmark_new = Bookmark.new
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark_new = current_user.bookmarks.build(params.require(:bookmark).permit(:url, :topic_name))
    @topic = Topic.find_or_initialize_by(name: @bookmark_new.topic_name)
    @bookmark_new.topic = @topic
    @bookmark_new.retrieve_preview
    if @bookmark_new.save
      redirect_to :back
    else
      flash[:error] = "Error creating bookmark. Please try again."
      render :back
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    if BookmarkPolicy.new(current_user, @bookmark).destroy?
      @bookmark.destroy
      redirect_to :back
    end
  end

private

  def bookmark_params
    params.require(:bookmark).permit(:url, :topic_name)
  end

end