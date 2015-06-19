class Food < ActiveRecord::Base
	has_many :contents
	has_many :cart_items
	
scope :name_like, -> (name) { where("name ilike ?", name)}
end
