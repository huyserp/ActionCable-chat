class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :chatrooms
  has_many :messages

  COLORS = ['54478C', '2C699A', '048BA8',
            '0DB39E', '16DB93', '83E377',
            'B9E769', 'EFEA5A', 'F1C453', 'F29E4C']

  validates :nickname, presence: true
  validates :color, presence: true, inclusion: { in: COLORS }
end
