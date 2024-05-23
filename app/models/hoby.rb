class Hoby < ApplicationRecord
	has_many :posts
	has_many :tags
	has_one :type
end
