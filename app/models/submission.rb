class Submission < ApplicationRecord
	belongs_to :requirement
	belongs_to :recruiter, :class_name => 'User',:foreign_key => 'recruiter_id'
	belongs_to :profile
	after_create :update_color
	has_many :comments, as: :commentable
	scope :submissions_by, ->(recruiter = nil, requirement = nil) { 
		where(recruiter_id: recruiter, requirement_id: requirement)
	}

	def update_color
		self.requirement.update_attributes(status: "in_progress")
	end	

end
