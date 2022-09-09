class Message < ApplicationRecord
  # belongs_to :conversation
   belongs_to :sender, class_name: :User
   belongs_to :receiver, class_name: :User
  #  validates_presence_of :content,, foreign_key: 'sender_id'

  # after_create_commit { MessageBroadcastJob.perform_later(self) }
end
