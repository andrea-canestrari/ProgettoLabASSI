class Handler < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook] 
         
         
  def self.from_omniauth(auth)
         where(provider: auth.provider, uid: auth.uid).first_or_create do |admin|
           admin.email = auth.info.email
           admin.password = Devise.friendly_token[0,20]
         end
       end
     
       def self.new_with_session(params, session)
         super.tap do |admin|
           if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
               user.email = data["email"] if user.email.blank?
               end
           end
         end

end
