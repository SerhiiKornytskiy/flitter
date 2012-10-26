class Twit < ActiveRecord::Base
  attr_accessible :created_at, :message, :user_id
  belongs_to :user
  validates_presence_of :message, :created_at, :user_id
end
