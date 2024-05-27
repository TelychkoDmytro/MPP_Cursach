class PostTag < ApplicationRecord
  belongs_to :post
  belongs_to :tag

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "post_id", "tag_id", "updated_at"]
  end
end
