class GroupsController < ApplicationController
	before_action :authenticate_user!

	def index
		@groups = Group.where(user_id: current_user.id)
	end

	def create
		@group = Group.new
		@group.gname = params[:gname]
		@group.user_id = current_user.id
		respond_to do |format|
			if @group.save
		    	format.html { redirect_to groups_path }
	  			
	  		else
	  			format.html { render action: "new" }
	  			format.js
	  		end
	   end
	end

	def new
		@group = Group.new
 	end

 	def destroy
 		group = Group.find_by(id: params[:id])
	 	group.destroy
	 	render json: group
 	end
end
