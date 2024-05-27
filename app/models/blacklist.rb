class Blacklist < ApplicationRecord
  belongs_to :user

  validates :reason, presence: true
  validates :banned_at, presence: true
  validates :is_permanent, inclusion: { in: [true, false] }

  after_create :block_user

  def self.ransackable_associations(auth_object = nil)
    ["user"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["ban_duration", "banned_at", "created_at", "id", "is_permanent", "reason", "updated_at", "user_id"]
  end

  private

  def block_user
    user.update(blocked: true)
  end
end
