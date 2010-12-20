class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role

  has_many :prayers

  ROLES = %w[admin moderator member]

  before_save :set_sensible_defaults

  

private


def set_sensible_defaults

  if self.role.blank?
    self.role = "member"
  end

end


end
