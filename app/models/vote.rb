class Vote < ActiveRecord::Base
  belongs_to :voteable, polymorphic: true
  belongs_to :creator, class_name: "User", foreign_key: "user_id"
  validates_uniqueness_of :user_id, scope: [:voteable_type, :voteable_id]
end
