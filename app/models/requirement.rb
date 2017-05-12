class Requirement < ApplicationRecord
	belongs_to :manager, :class_name => 'User', :foreign_key => 'manager_id', :validate => true
	has_many :assigned_requirements
	has_many :recruiters, through: :assigned_requirements, :foreign_key => 'recruiter_id'
	enum status: [:fresh, :assigned, :in_progress, :closed]
	has_many :submissions
	def color_code
		case self.status
		when "fresh"
			return "label-success"
		when "assigned"
			return "label-primary"
		when "in_progress"
			return "label-warning"
		when "closed"
			return "label-danger"
		end	
	end	

end
