class CartsController < ApplicationController
  def show
    @cart_items = current_cart.cart_items
  end

   def checkout

   		@cart_items= current_cart.cart_items





      #Define Nutrient Groups => string, reference values, labels
      #________________-Vitamins__________
      vitamins_string = 
                  ["Vitamin A;  RAE",
                  "Thiamin",
                  "Riboflavin",
                  "Niacin",
                  "Pantothenic acid",
                  "Vitamin B-6",
                  "Folate;  total",
                  "Vitamin B-12",
                  "Vitamin C;  total ascorbic acid",
                  "Vitamin D",
                  "Vitamin E (alpha-tocopherol)" ]
      #Reference RDI for 18-30yr old male         
      vitamins_reference = [900,1.2,1.3,16,5,1.3,400,2.4,90,15,15]
                            





   		@nutrients = vitamins_string
   		
   		@total = Array.new(@nutrients.length,0)
  		@nutrients.each_with_index do |nutrient,index|

   		  @cart_items.each do |cart_item|

	   			result= cart_item.food.contents.find_by(nut_type: nutrient)
		   			if result.present?
		   			@total[index]=@total[index]+result.nut_size/vitamins_reference[index]*100
		   			end
	 		  end
		  end



   #end checkout function     
   end

   # def return
   #   @movie = Movie.find(params[:id])
   #   @movie.borrower = @movie.borrowed_on = @movie.due_on = nil
   #   @movie.save!
   #   redirect_to(movies_url)
   # end


end