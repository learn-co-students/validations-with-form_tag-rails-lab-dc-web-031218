class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :content, length: {minimum: 100}
	validate :valid_category

	def valid_category
		if !["Fiction", "Non-Fiction"].include? category
			errors.add(:category, 'Improper category!')
		end
	end
end
