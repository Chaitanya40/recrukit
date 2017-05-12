class Recruiter::SubmissionsController < ApplicationController
	
	def new
		@profile = Profile.new
	end

	def create
		set_requirement
		profile = Profile.new(profile_params)
		if profile.save

			Submission.create(profile_id: profile.id, requirement_id: @requirement.id, recruiter_id: current_user.id)
			flash[:notice] = "Profile submitted successfully"
			redirect_to recruiter_requirement_submissions_path
		else
			flash[:error] = "Profile could not be created"
			render "new"
		end	
	end

	def edit
	end
	
	def update
	end

	def show
		@submission = Submission.where(recruiter_id: current_user.id, id: params[:id]).first
		if @submission
			@profile = @submission.profile
			render "show"
		else
			flash[:error] = "You are not the owner of this submission"
			redirect_to recruiter_requirement_submissions_path(requirement_id: params[:requirement_id])
		end		
	end	

	def index
		@submissions = Submission.where(recruiter_id: current_user.id) 
	end	

	private
		def profile_params
			profile = params[:profile]
			{skills: profile[:skills].reject { |c| c.empty?}, resume: profile[:resume], experience: profile[:experience], state: params[:state], city: profile[:city]}
		end

		def set_requirement
			@requirement = Requirement.find params[:requirement_id]
		end


		
end
