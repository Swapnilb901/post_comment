class Post < ApplicationRecord
	validates :title, :body, presence: true
	belongs_to :user
	has_many :comments
	has_many :likes
	has_one_attached :image
	def check_like?(user)
		likes.find { |like| like.user_id == user.id}
	end
end
