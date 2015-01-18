class LikesController < ApplicationController

  def create
    @like_bookmark = Bookmark.find(params[:bookmark_id])
    if Like.create(user: current_user, bookmark: @like_bookmark)
      redirect_to(:back)
    else
      flash[:error] = "Unable to unlike. Try once more?"
      redirect_to(:back)
    end
  end

  def destroy
    @like_bookmark = Bookmark.find(params[:bookmark_id])
    like = @like_bookmark.likes.find(params[:id])
    # authorize favorite

    if like.destroy
      redirect_to(:back)
    else
      flash[:error] = "Unable to unlike. Try once more?"
      redirect_to(:back)
    end
  end
  
end