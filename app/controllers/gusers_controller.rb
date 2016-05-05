class GusersController < ApplicationController

	def show
		#puts params[:id]
		@users = Guser.where(group_id: params[:id])
		render json: @users
	end

	def destroy
		#puts params
		user = Guser.find_by(user_id: params[:id],group_id: params[:gid])
		user.destroy
		render json: user
	end

	def create 
		user = Guser.new
		user.user_id = params[:uid]
		user.group_id = params[:gid]
		user.save
		render json: user
	end

	def delall
		users = Guser.find_by(group_id: params[:gid])
		users.destroy
		render json: users
	end
	
end
