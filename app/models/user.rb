# class User < ActiveRecord::Base
#   # Include default devise modules. Others available are:
#   # :confirmable, :lockable, :timeoutable and :omniauthable
#   devise :database_authenticatable, :registerable,
#          :recoverable, :rememberable, :trackable, :validatable
#   has_many :friends 
# end
class User < ActiveRecord::Base

acts_as_follower
acts_as_followable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
     :omniauthable, :omniauth_providers => [:twitter,:facebook]
     #:omniauthable, :omniauth_providers => [:digitalocean]
  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.nickname
        user.name = auth.info.name   # assuming the user model has a name

        user.password = Devise.friendly_token[0,20]
      end
  end


end