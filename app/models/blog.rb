class Blog < ApplicationRecord
  mount_uploaders :images, ImagesUploader
  mount_uploader :audio, AudioUploader
  enum status: { draft: 0, published: 1 }
  extend FriendlyId
  friendly_id :permalink, use: [:slugged, :history]
  validates :permalink, presence: true, uniqueness: true
  validates_presence_of :title, :body, :topic_id

  belongs_to :topic
  belongs_to :user
  has_many :comments, dependent: :destroy


  def self.special_blogs
    all
  end

  def self.featured_blogs
    limit(2)
  end

  def self.recent
    order("created_at DESC")
  end

  def should_generate_new_friendly_id?
       permalink_changed?
  end

end
