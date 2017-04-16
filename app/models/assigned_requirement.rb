class AssignedRequirement < ApplicationRecord
	belongs_to :requirement
	belongs_to :recruiter, :class_name => 'User',:foreign_key => "recruiter_id"
end
