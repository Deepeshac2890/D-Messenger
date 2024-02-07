class Message < ApplicationRecord
  belongs_to :user, foreign_key: :from_user_id
  validates :message, presence: true
  scope :custom_display, -> { order(:created_at).last(20)}
end