class UsersController < ApplicationController
<<<<<<< HEAD
=======
 
>>>>>>> 4746a91393ef15a2fae932dbf7dac2abd8d58486
  def index
  	@followables_array = Follow.where(:follower_id => current_user.id).pluck(:followable_id)
  	@followables = []
  	$non_followable_emails = []
  	@followables_array.each do |id|
  		@user = User.find(id)
  		
  		@followables.push(@user)
  	end

  	@allusers = User.all

  	@allusers.each do |user|
  		if !@followables.include? user
  			$non_followable_emails.push(user.email)
  		end
  	end

  	
  end

  def ajax_response
  	respond_to do |format|
  		@email = params[:user][:email]
  	    if $non_followable_emails.include? @email
  	    	@user = User.find_by_email(@email)
  	    	current_user.follow(@user)
  		format.html
  		format.js
  		end
  	end
  end

  def ajax_response_remove
  	respond_to do |format|
  		@id = params[:id]
  		@user = User.find(@id)
  		current_user.stop_following(@user)
  		format.html
  		format.js
  	end
  end

  def user_params
  	params.require(:user).permit(:email)
  end


<<<<<<< HEAD
end
=======
end
>>>>>>> 4746a91393ef15a2fae932dbf7dac2abd8d58486
