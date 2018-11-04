class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog

  validates :content, presence: true, length: { minimum: 5, maximimum: 1000 }
  default_scope -> { order('created_at DESC') }

  after_create_commit { CommentBroadcastJob.perform_later(self) }
end
