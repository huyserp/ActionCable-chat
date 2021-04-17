class Chatroom < ApplicationRecord
  belongs_to :user
  has_many :messages

  validates :topic, presence: true
end
