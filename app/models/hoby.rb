class Hoby < ApplicationRecord
	has_many :posts
	has_many :tags
	has_many :types

	def self.ransackable_associations(auth_object = nil)
		["posts", "tags", "types"]
	end

	def self.ransackable_attributes(auth_object = nil)
		["created_at", "id", "title", "updated_at"]
	end
end
