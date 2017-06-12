class Manager::ClientsController < ApplicationController
	def index
		@clients = Client.all
	end

	def new
		@client = Client.new
	end

	def create
		@client = Client.new(client_params)
		if @client.save
			flash[:notice] = "Client added successfully"
			redirect_to manager_clients_path
		else
			flash[:error] = "Client could not be added"
			render "new"
		end		 
	end


	private
	def client_params
		client = params[:client]
		{first_name: client[:first_name], last_name: client[:last_name], company: client[:company], email: client[:email]}
	end	

end
