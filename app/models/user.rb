class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable,  and :omniauthable
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable

  validates_uniqueness_of :username
  has_one_attached :profile_picture
  has_many :discussions
  has_many :posts, dependent: :destroy
  has_many :events
  has_many :event_threads
end
