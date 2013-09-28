  class HomeController < ApplicationController
  def index
    if current_user && current_user.feeds.count >0
      FeedWorker.perform_async(Feed.first.id)
    end
  end
end
