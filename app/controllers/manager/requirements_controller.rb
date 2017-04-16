class Manager::RequirementsController < ApplicationController
	def index
		@requirements = current_user.created_requirements
		@recruiters = User.where(role: 1)
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

	def assign
		req_ids = params[:req_ids]
		rec_ids = params[:rec_ids]
		begin
			req_ids.each do |req_id|
				rec_ids.each do |rec_id| 
					existing_obj = AssignedRequirement.where('requirement_id = ? AND recruiter_id = ?', req_id.to_i, rec_id)
					if !existing_obj.exists?
						AssignedRequirement.create(requirement_id: req_id, recruiter_id: rec_id, manager_id: current_user.id)
					end
				end
			end
			render json: {message: "Success"}
		rescue
			render json: {message: "Error"}
		end	
	end	

	private
	def requirement_params
		requirement = params[:requirement]
		skills = requirement[:skills]
		{user_id: current_user.id, skills: skills.reject { |c| c.empty? }, experience: requirement[:experience], state: requirement[:state], city: requirement[:city]}
	end	



end
