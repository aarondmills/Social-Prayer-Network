class User < ActiveRecord::Base
  include Gravtastic
  gravtastic
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable


  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role, :firstname, :lastname, :location, :avatar

  has_many :prayers, :dependent => :destroy
  
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["user_hash"]
        user.email = data["email"]
	user.firstname = data["first_name"]
	user.lastname = data["last_name"]
	user.location = data["location"]
      end
    end
  end

  


  ROLES = %w[admin moderator member]

  before_save :set_sensible_defaults

  cattr_reader :per_page
  @@per_page = 10

a
    data = access_token['extra']['user_hash']
    if user = User.find_by_email(data["email"])
      user
    else # Create an user with a stub password. 
      User.create!(:email => data["email"], :password => Devise.friendly_token[0,20], :firstname => data["first_name"], :lastname => data["last_name"], :location => data["location"]) 
    end
  end 


  

private


def set_sensible_defaults

  if self.role.blank?
    self.role = "member"
  end

end


end
