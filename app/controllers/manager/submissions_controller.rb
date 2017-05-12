class Manager::SubmissionsController < ApplicationController
	def show
		@submission = Submission.find(params[:id])
		@profile = @submission.profile
	end

	def send_email
		@submission = Submission.find(params[:sub_id].to_i)
		begin
			ProfileMailer.send_profile(params[:req_id].to_i,@submission.profile.id,1).deliver_now
			render json: {message: "Success"}
		rescue
			render json: {message: "Error"}
		end	
	end

	def add_comment

	end	

end
