class Event < ApplicationRecord
  belongs_to :user
  has_many :event_threads
  has_many_attached :attachments
end
