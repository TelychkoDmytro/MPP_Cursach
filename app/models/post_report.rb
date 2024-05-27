class PostReport < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :reason, presence: true
  validates :reported_at, presence: true
  validates :status, inclusion: { in: %w[pending resolved] }

  enum status: { pending: 'pending', resolved: 'resolved' }

  def self.ransackable_associations(auth_object = nil)
    ["post", "user"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["post_id", "user_id", "reason", "reported_at", "status", "created_at", "updated_at"]
  end
end
