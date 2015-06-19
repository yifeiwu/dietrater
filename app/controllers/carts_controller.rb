class CartsController < ApplicationController
  def show
    @cart_items = current_cart.cart_items
  end

   def checkout

   		@cart_items= current_cart.cart_items
   		nutrients = ["Vitamin D3 (cholecalciferol)","Vitamin C;  total ascorbic acid"]
   		@total = Array.new(nutrients.length,0)
  		nutrients.each_with_index do |nutrient,index|
   			@cart_items.each do |cart_item|
	   			result= cart_item.food.contents.find_by(nut_type: nutrient)
		   			if result.present?
		   			@total[index]=@total[index]+result.nut_size.to_f
		   			end
	 		end
 
   			#@my_store = @user.stores.select{|s| s.id == store_id}
   			#contents.select(:nut_type) { |content| content.nut_type =~ /Fluoride/}
   			#	result= cart_item.food.contents.select{ |content| content.nut_type =~ /Fluoride/}
		end




   		# @cart_items.each do |cart_item|
   		# 	this_food = cart_item.food
   		# 	puts this_food.contents.first.nut_type

   		# end
     # @movie = Movie.find(params[:id])
     # if request.post?
     #   # It's an update
     #   @movie.borrower = params[:movie][borrower]
     #   @movie.borrowed_on = today = Date.today
     #   @movie.due_on = today + 7
     #   if @movie.save
     #     flash[:notice] = 'Movie was successfully created.'
     #     redirect_to(movies_url)
     #   else
     #     render :action => "checkout"
     #   end
     # else
     #   # Render the template, the default
     # end
   end

   # def return
   #   @movie = Movie.find(params[:id])
   #   @movie.borrower = @movie.borrowed_on = @movie.due_on = nil
   #   @movie.save!
   #   redirect_to(movies_url)
   # end


end