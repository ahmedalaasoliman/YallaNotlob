class HomeController < ApplicationController
  def index  
	@user_id = current_user.id
	@order = Order.where('user_id = ?' , @user_id)

	@friend=User.find_by_sql (["select name from users, friends where user_id = ? and users.id = friends.friend", @user_id])
    
	#@friend=
  end
end
