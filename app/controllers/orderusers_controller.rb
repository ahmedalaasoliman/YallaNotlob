class OrderusersController < ApplicationController

	def destroy
		user = Orderuser.find_by(user_id: params[:id], order_id: params[:ordid])
		user.destroy
		render json: user
	end

end
