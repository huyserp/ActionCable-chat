class Chatroom < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy

  validates :topic, presence: true, uniqueness: true
end
