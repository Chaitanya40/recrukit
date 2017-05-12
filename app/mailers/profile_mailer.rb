class ProfileMailer < ApplicationMailer
  default from: "recrukitmanager@example.com"

  def send_profile(requirement_id, profile_id, client_id)
  	@requirement = Requirement.find requirement_id
  	@profile = Profile.find profile_id
  	@resume = @profile.resume.url
  	@client = Client.find client_id
  	attachments['Resume.pdf'] = File.read(@profile.resume.file.file)
  	mail(to: @client.email, subject: 'Recrukit profile')
  end	
end
