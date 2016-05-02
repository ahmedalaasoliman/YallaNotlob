# class User < ActiveRecord::Base
#   # Include default devise modules. Others available are:
#   # :confirmable, :lockable, :timeoutable and :omniauthable
#   devise :database_authenticatable, :registerable,
#          :recoverable, :rememberable, :trackable, :validatable
#   has_many :friends 
# end
class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
     :omniauthable, :omniauth_providers => [:twitter]
     #:omniauthable, :omniauth_providers => [:digitalocean]

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.nickname
        user.password = Devise.friendly_token[0,20]
      end
  end
end

# class User < ActiveRecord::Base
#   # existing code

#   end
