class LikesController < ApplicationController

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    Like.create(user: current_user, bookmark: @bookmark)
  end