class User < ActiveRecord::Base
  include Gravtastic
  gravtastic
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role, :firstname, :lastname, :location, "avatar

  has_many :prayers, :dependent => :destroy

  


  ROLES = %w[admin moderator member]

  before_save :set_sensible_defaults

  cattr_reader :per_page
  @@per_page = 10

  

private


def set_sensible_defaults

  if self.role.blank?
    self.role = "member"
  end

end


end
