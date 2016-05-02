class GroupsController < ApplicationController
	before_action :authenticate_user!

	def index
		@groups = Group.where(user_id: current_user.id)
		@group = Group.new
	end

	def create
		@group = Group.new(params.require(:group))
		@group['user_id'] = current_user.id
		@group.save
		respond_to do |format|
	      format.html { redirect_to groups_path }
	      format.json { head :no_content }
	      format.js   { render :layout => false }
	   end
	end

	def new
		@group = Group.new
 	end
end
