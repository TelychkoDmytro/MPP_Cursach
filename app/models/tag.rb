class Tag < ApplicationRecord
  belongs_to :hoby

  has_many :post_tag, dependent: :destroy
  has_many :posts, through: :post_tag

end
