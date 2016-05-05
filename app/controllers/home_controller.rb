class HomeController < ApplicationController
  def index  
	@user_id = current_user.id
	@order = Order.where('user_id = ?' , @user_id)

	#@friend=User.find_by_sql (["select name from users, friends where user_id = ? and users.id = friends.friend", @user_id])
    #@friend_orders=Order.find_by_sql(["select order from orders o , friends f , users u where f.user_id= ? and u.id = f.friend and f.friend = o.user_id" , @user_id])
	#@friend=
	#@friend_orders=Order.find_by_sql(["select name , order_for from orders , friends  , users  
		#where friends.user_id= ? and users.id = friends.friend 
		#and friends.friend = users.id" , @user_id]).last(5)
	@friend_orders=Order.find_by_sql(["select name , order_for , order_from from orders , follows  , users  
									where follows.follower_id= ? and users.id = follows.followable_id and 
									follows.follower_id = users.id" , @user_id]).last(5)
  end
end
