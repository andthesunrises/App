class Blog < ApplicationRecord
  
  #enum is used for status toggle
  enum status: { draft:0, published:1}
  extend FriendlyId
  friendly_id :title, use: :slugged

  #validation
  validates_presence_of :title, :body
  
  belongs_to :topic
end
