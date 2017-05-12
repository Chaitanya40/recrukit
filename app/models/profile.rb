class Profile < ApplicationRecord
	mount_uploader :resume, ResumeUploader
end
