class Feed
  include Mongoid::Document
  include Mongoid::Timestamps
  belongs_to :user
  embeds_many :feed_items, class_name: "FeedItem"  

  field :provider
  field :token
  field :expire_time
  field :identifier
  def self.create_or_update(auth,user)
    feed = Feed.where(identifier:auth.uid).first
    unless feed
      feed = Feed.create(provider:auth.provider,
                          identifier:auth.uid,
                          token:auth.credentials.token,
                          expire_time:auth.credentials.expires_at,
                          user: user)
    else
      feed.token = auth.credentials.token
      feed.expire_time = auth.credentials.expires_at
    end
    feed 
  end  
end
