class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
     # Take a look at these in your server logs
     # to get a sense of what you're dealing with.
     # puts "INCOMING PARAMS HERE: #{params}"

    # You put the message-splitting and business
    # magic here.
     # Find the user by using params[:sender]
     # Find the topic by using params[:subject]
     # Assign the url to a variable after retreiving it from params["body-plain"]

     # Check if user is nil, if so, create and save a new user

     # Check if the topic is nil, if so, create and save a new topic

     # Now that we're sure we have a valid user and topic, build and save a new bookmark

    # Assuming all went well.
    @user = User.find_or_create_by(email: params[:sender])
    @topic = Topic.find_or_initialize_by(name: params[:subject])
    @url = params["body-plain"]

    @bookmark_new = Bookmark.new

    @bookmark_new.user = @user
    @bookmark_new.url = @url
    @bookmark_new.topic = @topic
    @bookmark_new.topic_name = @topic.name
    @bookmark_new.save_sanitized_with_preview

    head 200
  end
end