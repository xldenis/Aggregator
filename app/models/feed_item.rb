class FeedItem
  include Mongoid::Document
  embedded_in :feed
  field :created_time ,:type=> DateTime
  field :type
  field :message
  field :link
  field :item_id

  validates_presence_of :item_id
  validates_presence_of :type
  validates_presence_of :created_time
  validates_uniqueness_of :item_id, scope: :feed


end
