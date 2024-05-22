class Hoby < ApplicationRecord
	has_many :posts
	has_many :types
	has_many :tags
end
