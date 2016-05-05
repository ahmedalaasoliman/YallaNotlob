1)rails g model Notification recipient_id:integer actor_id:integer 
read_at:datetime action:string notifiable_id:integer notifiable_type:string

2)rake db:migrate

3)notification model :

class Notification < ActiveRecord::Base
  belongs_to :recipient, class_name: "User"
  belongs_to :actor, class_name: "User"
  belongs_to :notifiable, polymorphic: true

  scope :unread, ->{ where(read_at: nil) }
end

4)user model : 

class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  
  #da el satr eli ana 3ayzo 
  has_many :notifications, foreign_key: :recipient_id
  
  has_many :forum_threads
  has_many :forum_posts
end 

5)ForumPostsController :
#el mafrood 3andi yb2a add order 
#aw add item aw add friend

  def create
    @forum_post = @forum_thread.forum_posts.new(forum_post_params)
    @forum_post.user = current_user
    if @forum_post.save

      # Create the notifications
      (@forum_thread.users.uniq - [current_user]).each do |user|
        Notification.create(recipient: user, actor: current_user, action: "posted", notifiable: @forum_post)
      end

      redirect_to @forum_thread
    else
      render "forum_threads/show"
    end
  end

6)model forum post : 

has_many :users , through: :forum_posts



7)# ba3 el 5atwa de  fe el video 
#kan by insert fe table el notification 

#in video now successfully inserted in 
#database

8) routes file : 

resources :notifications

9) create the notifications controller : 

class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = Notification.where(recipient: current_user).unread
  end

  def mark_as_read
    @notifications = Notification.where(recipient: current_user).unread
    @notifications.update_all(read_at: Time.zone.now)
    render json: {success: true}
  end
end

10) notification model again : 

class Notification < ActiveRecord::Base
  belongs_to :recipient, class_name: "User"
  belongs_to :actor, class_name: "User"
  belongs_to :notifiable, polymorphic: true

  scope :unread, ->{ where(read_at: nil) }
end

11) app/views/notifications/index.json.jbuilder 

json.array! @notifications do |notification|
  json.id notification.id
  #json.recipient notification.recipient
  json.actor notification.actor.username
  json.action notification.action
  json.notifiable do #notification.notifiable
    json.type "a #{notification.notifiable.class.to_s.underscore.humanize.downcase}"
  end
  json.url forum_thread_path(notification.notifiable.forum_thread, anchor: dom_id(notification.notifiable))
end 

12) routes :


  resources :notifications do
    collection do
      post :mark_as_read
    end
  end

#hena fe min 25 fe el video 

13)/app/views/layouts/application.html.erb

