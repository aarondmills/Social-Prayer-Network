class Prayer < ActiveRecord::Base
	attr_accessible :request, :category_id

	belongs_to :category
	belongs_to :user

	validates_presence_of :request, :category_id

	

	
end
