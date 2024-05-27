class Tag < ApplicationRecord
  belongs_to :hoby

  has_many :post_tag, dependent: :destroy
  has_many :posts, through: :post_tag

  def self.ransackable_associations(auth_object = nil)
    ["hoby", "post_tag", "posts"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "hoby_id", "id", "title", "updated_at"]
  end
end
