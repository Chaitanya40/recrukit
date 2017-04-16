class Recruiter::RequirementsController < ApplicationController
	def index
		@requirements = current_user.requirements
	end
	
	def new
		@requirement = Requirement.new()
	end

	def create
		@requirement = Requirement.new(requirement_params)
		if @requirement.save
			flash[:notice] = "Requirement created successfully"
			redirect_to requirements_path
		else
			flash[:error] = "Could not save requirement"
			render "new"
		end		
	end
		
	def edit
	end
	
	def destroy
	end

	def update
	end

	private
	def requirement_params
		requirement = params[:requirement]
		skills = requirement[:skills]
		{user_id: current_user.id, skills: skills.reject { |c| c.empty? }, experience: requirement[:experience], state: requirement[:state], city: requirement[:city]}
	end	



end
