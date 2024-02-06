class Message < ApplicationRecord
  belongs_to :user, foreign_key: :from_user_id
  validate :message, presence: true
end