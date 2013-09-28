class FeedWorker
  include Sidekiq::Worker

  def perform(feed_id)
    feed = Feed.find(feed_id)
    graph = Koala::Facebook::API.new(feed.token)
    items = graph.get_connections("me","feed")
    items.each do |item|
      feed.feed_items.create(item_id:item['id'],
                              type:item['type'],
                              message:item['message'],
                              link:item['link'],
                              created_time:item['created_time'])
    end

  end
end
