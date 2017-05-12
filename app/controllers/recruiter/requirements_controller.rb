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

	def show
		assigned_requirement = AssignedRequirement.where(requirement_id: params[:id], recruiter_id: current_user.id).first
		if assigned_requirement
			@requirement = assigned_requirement.requirement
			@submissions = Submission.submissions_by(current_user.id, params[:id])
			render "show"
		else
			flash[:error] = "You are not authorised to view that requirement"
			redirect_to recruiter_requirements_path
		end		
	end	

	private
	def requirement_params
		requirement = params[:requirement]
		skills = requirement[:skills]
		{user_id: current_user.id, skills: skills.reject { |c| c.empty? }, experience: requirement[:experience], state: requirement[:state], city: requirement[:city]}
	end	



end
