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

	has_many :comments, dependent: :destroy

	has_many :post_reports, dependent: :destroy

	def self.ransackable_associations(auth_object = nil)
		["comments", "hoby", "likes", "post_tag", "tags", "type", "user"]
	end

	def self.ransackable_attributes(auth_object = nil)
		["annotation", "created_at", "description", "hoby_id", "id", "type_id", "updated_at", "user_id"]
	end

	private

	def type_belongs_to_hoby
		if hoby_id.present? and type_id.present?
			valid_type = Type.where(id: type_id, hoby_id: hoby_id).exists?
			errors.add(:type_id, I18n.t('post.must_belong_to_hobby')) unless valid_type
		else
			errors.add(:base, I18n.t('post.must_be_hobby_n_type'))
		end
	end

	def tags_belongs_to_hoby
		if hoby_id.present?
		else
			errors.add(:base, I18n.t('post.hobby'))
		end 
	end
end
