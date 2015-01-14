class BookmarksController < ApplicationController

  def index
    @bookmarks = Bookmark.all
    @bookmark_new = Bookmark.new
  end

  def new
  end

  def create
    @bookmark_new = current_user.bookmarks.build(params.require(:bookmark).permit(:url, :title))
    if @bookmark_new.save
      redirect_to bookmarks_path   
    else
      flash[:error] = "Error creating bookmark. Please try again."
      render :index
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.destroy
      redirect_to bookmarks_path
    end
  end

private

  def bookmark_params
    params.require(:bookmark).permit(:url, :title)
  end

end