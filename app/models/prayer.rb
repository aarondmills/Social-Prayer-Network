class Prayer < ActiveRecord::Base
	attr_accessible :request, :category_id, :user_id

	belongs_to :category
	belongs_to :user

	validates_presence_of :category_id
	validates_presence_of :request, :on => :create, :message => "Cant be blank"
	validates_presence_of :request, :on => :update, :message => "You can not leave your request blank!"

	scope :returncat, lambda {|category| where(:category_id => category)}

	

	
end
