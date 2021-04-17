class Chatroom < ApplicationRecord
  validates :topic, presence: true
end
