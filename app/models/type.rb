class Type < ApplicationRecord
	belongs_to :hoby

	def self.ransackable_associations(auth_object = nil)
		["hoby"]
	end

	def self.ransackable_attributes(auth_object = nil)
		["created_at", "hoby_id", "id", "title", "updated_at"]
	end
end
