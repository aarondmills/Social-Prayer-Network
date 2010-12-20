class Category < ActiveRecord::Base
	has_many :prayers
	has_many :resources
end
