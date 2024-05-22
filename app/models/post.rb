class Post < ApplicationRecord
	belongs_to :user
	belongs_to :hoby
	belongs_to :type

	validate :type_belongs_to_hoby

	private

	def type_belongs_to_hoby
		if hoby_id.present? && type_id.present?
			valid_type = Type.where(id: type_id, hoby_id: hoby_id).exists?
			errors.add(:type_id, 'must belong to the selected hoby') unless valid_type
		else
			errors.add(:base, 'Hoby and Type must be present')
		end
	end
end
