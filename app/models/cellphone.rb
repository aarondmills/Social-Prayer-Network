class Cellphone < ActiveRecord::Base
  belongs_to :user

  attr_accessible :number, :active, :token
end
