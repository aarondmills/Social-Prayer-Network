class Resource < ActiveRecord::Base
	cattr_reader :per_page
	@@per_page = 10
	belongs_to :category
	attr_accessible :title, :description, :url, :category_id

	validates_presence_of :category_id
	validates_presence_of :title
	validates_presence_of :description
	validates_presence_of :url

	scope :returncat, lambda {|category| where(:category_id => category)}


end
