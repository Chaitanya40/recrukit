class AssignedRequirement < ApplicationRecord
	belongs_to :requirement
	belongs_to :recruiter, :class_name => 'User',:foreign_key => "recruiter_id"
	after_create :update_color

	def update_color
		self.requirement.update_attributes("assigned")
	end	
end
