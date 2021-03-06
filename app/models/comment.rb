class Comment < ActiveRecord::Base
  include Voteable
  validates :body, presence: true
  belongs_to :creator, class_name: "User", foreign_key: "user_id"
  belongs_to :post
  has_many :votes, as: :voteable
end
