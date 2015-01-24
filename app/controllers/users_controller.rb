class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "User information updated"
      redirect_to edit_user_registration_path
    else
      flash[:error] = "Invalid user information"
      redirect_to edit_user_registration_path
    end
  end

  def show
    @user = User.find(params[:id])
    @bookmark = Bookmark.new
    @bookmarks = @user.bookmarks
    @liked_bookmarks = @user.liked_bookmarks
    # @posted_topics = @user.bookmarks.includes(:topic).group_by{|bookmark| bookmark.topic}.paginate(page: params[:page], per_page: 2)
    # @liked_topics = @user.liked_bookmarks.includes(:topic).group_by{|bookmark| bookmark.topic}.paginate(page: params[:page], per_page: 2)
  end

  def index
    @users = User.top_rated.paginate(page: params[:page], per_page: 10)
  end

  private

  def user_params
    params.require(:user).permit(:name, :avatar, :email_favorites)
  end
end
