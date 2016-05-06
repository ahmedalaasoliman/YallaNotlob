class HomeController < ApplicationController



 #  def index  
	# @user_id = current_user.id
	# @order = Order.where('user_id = ?' , @user_id)

	# #@friend=User.find_by_sql (["select name from users, friends where user_id = ? and users.id = friends.friend", @user_id])
 #    #@friend_orders=Order.find_by_sql(["select order from orders o , friends f , users u where f.user_id= ? and u.id = f.friend and f.friend = o.user_id" , @user_id])
	# #@friend=
	# #@friend_orders=Order.find_by_sql(["select name , order_for from orders , friends  , users  
	# 	#where friends.user_id= ? and users.id = friends.friend 
	# 	#and friends.friend = users.id" , @user_id]).last(5)
	# @friend_orders=Order.find_by_sql(["select name , order_for , order_from from orders , follows  , users  
	# 								where follows.follower_id= ? and users.id = follows.followable_id and 
	# 								follows.follower_id = users.id" , @user_id]).last(5)


  

  def index
 
	 @user_id = current_user.id
	 @order = Order.where('user_id = ?' , @user_id).last(5)

	 #@friend=User.find_by_sql (["select name from users, friends where user_id = ? and users.id = friends.friend", @user_id])
     #@friend_orders=Order.find_by_sql(["select order from orders o , friends f , users u where f.user_id= ? and u.id = f.friend and f.friend = o.user_id" , @user_id])
	 #@friend=
	 #@friend_orders=Order.find_by_sql(["select name , order_for from orders , friends  , users  
	 	#where friends.user_id= ? and users.id = friends.friend 
	 	#and friends.friend = users.id" , @user_id]).last(5)
	 # @friend_orders=Order.find_by_sql(["select name , order_for , order_from from orders , follows  , users  
	 								# where follows.id= ? and users.id = follows.id and 
	 								# follows.follower_id = users.id" , @user_id]).last(5)

	 @f = Follow.where(:follower_id => current_user).pluck(:followable_id)


    @activities = PublicActivity::Activity.order("created_at desc").where('owner_id in (?)' ,@f)



  @friend_orders=Order.find_by_sql(["SELECT name, orders.order_from, order_for
  FROM orders, follows, users
 WHERE follows.follower_id ="+@user_id.to_s+"
 AND users.id = follows.followable_id
 AND orders.user_id = follows.followable_id", @us]).last(5)
  
  
    end


  
end






