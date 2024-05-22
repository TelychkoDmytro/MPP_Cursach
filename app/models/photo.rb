class Photo < ApplicationRecord
	has_one :user

	has_many :post_photo, dependent: :destroy
	has_many :posts, through: :post_photo
end
