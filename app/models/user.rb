class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :created_requirements, :foreign_key => "manager_id", :class_name => "Requirement"       
  has_many :assigned_requirements, :foreign_key => "recruiter_id"
  has_many :requirements, through: :assigned_requirements
  
  def manager?
  	self.role == 0
  end

  def recruiter?
  	self.role == 1
  end	       
end
