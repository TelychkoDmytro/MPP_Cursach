class Post < ApplicationRecord
	belongs_to :user
	belongs_to :hoby
	belongs_to :type

	has_many :post_tag, dependent: :destroy
	has_many :tags, through: :post_tag

	# has_many :post_photo, dependent: :destroy
	# has_many :photos, through: :post_photo

	has_many_attached :images

	validate :type_belongs_to_hoby
	validate :tags_belongs_to_hoby

	has_many :likes, dependent: :destroy

	private

	def type_belongs_to_hoby
		if hoby_id.present? and type_id.present?
			valid_type = Type.where(id: type_id, hoby_id: hoby_id).exists?
			errors.add(:type_id, 'must belong to the selected hoby') unless valid_type
		else
			errors.add(:base, 'Hoby and Type must be present')
		end
	end

	def tags_belongs_to_hoby
		if hoby_id.present?
		else
			errors.add(:base, 'Hoby')
		end 
	end
end
