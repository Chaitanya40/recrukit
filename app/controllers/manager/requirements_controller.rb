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
			redirect_to manager_requirements_path
		else
			flash[:error] = "Could not save requirement"
			render "new"
		end		
	end
		
	def edit
		@requirement = Requirement.where(id:params[:id], manager_id: current_user.id).first
		if @requirement 
			render "edit"
		else
			flash[:error] = "You are unauthorized to perform that action"
			redirect_to manager_requirements_path
		end	
	end
	
	def destroy
	end

	def show
		@requirement = Requirement.where(id: params[:id], manager_id: current_user.id).first
		if @requirement
			@submissions = @requirement.submissions
			render "show"
		else
			flash[:error] = "You are not the owner of this requirement"
			redirect_to manager_requirements_path
		end	
	end	

	def update
		@requirement = Requirement.find params[:id]
		if @requirement.update_attributes(requirement_params)
			flash[:notice] = "Requirement updated successfully"
			redirect_to manager_requirement_path(params[:id])
		else
			flash[:error] = "Could not update requirement"
			render "edit"
		end		
	end

	def assign
		req_ids = params[:req_ids]
		rec_ids = params[:rec_ids]
		begin
			req_ids.each do |req_id|
				rec_ids.each do |rec_id| 
					existing_obj = AssignedRequirement.where('requirement_id = ? AND recruiter_id = ?', req_id.to_i, rec_id)
					binding.pry
					if !existing_obj.exists?
						AssignedRequirement.create(requirement_id: req_id, recruiter_id: rec_id, manager_id: current_user.id)
						# req = Requirement.find requirement_id
						# req.update_attributes(status: "assigned")
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
		{title: requirement[:title], description: requirement[:description], manager_id: current_user.id, skills: skills.reject { |c| c.empty? }, experience: requirement[:experience], state: requirement[:state], city: requirement[:city]}
	end	



end
