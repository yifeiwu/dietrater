class Food < ActiveRecord::Base
	has_many :contents
	has_many :cart_items

end
