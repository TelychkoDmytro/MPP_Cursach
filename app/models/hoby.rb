class Hoby < ApplicationRecord
	has_many :posts
	has_many :tags
	has_many :types
end
