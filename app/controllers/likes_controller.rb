class LikesController < ApplicationController

  def create
    @like_bookmark = Bookmark.find(params[:bookmark_id])
    Like.create(user: current_user, bookmark: @like_bookmark)
  end

  def destroy
    @like_bookmark = Bookmark.find(params[:bookmark_id])
    like = @like_bookmark.likes.find(params[:id])
    # authorize favorite

    if like.destroy
    flash[:notice] = "Bookmark unliked."
    # redirect_to [@post.topic, @post]
    else
    flash[:error] = "Unable to unlike. Try once more?"
    # redirect_to [@post.topic, @post]
  end
  
end