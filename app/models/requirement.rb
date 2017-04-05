class Requirement < ApplicationRecord
	belongs_to :user
	validate :check_empty

	def check_empty
		if skills.empty?
			errors.add(:skills, :invalid)
		end	
	end	
end
