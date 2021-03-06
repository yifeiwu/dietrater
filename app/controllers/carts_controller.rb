class CartsController < ApplicationController
  def show
    @cart_items = current_cart.cart_items
  end

   def checkout

   		@cart_items= current_cart.cart_items

      #Define Nutrient Groups => string, reference values, labels
      #________________-Vitamins__________
      vitamins_string = 
                  ["Vitamin A, RAE",
                  "Thiamin",
                  "Riboflavin",
                  "Niacin",
                  "Pantothenic acid",
                  "Vitamin B-6",
                  "Folate, total",
                  "Vitamin B-12",
                  "Vitamin C, total ascorbic acid",
                  "Vitamin D3 (cholecalciferol)",
                  "Vitamin E (alpha-tocopherol)",
                  "Vitamin K (phylloquinone)"]
      #Reference RDI for 18-30yr old male         
      vitamins_reference = [900,1.2,1.3,16,5,1.3,400,2.4,90,15,15,120]
      vitamins_labels = 
                ["Vitamin A",
                "Thiamin(B1)",
                "Riboflavin(B2)",
                "Niacin(B3)",
                "Vitamin B5",
                "Vitamin B6",
                "Folate(B9)",
                "Vitamin B12",
                "Vitamin C",
                "Vitamin D",
                "Vitamin E",
                "Vitamin K" ]
                          

   		nutrients = vitamins_string
      reference = vitamins_reference
   		
   		total = Array.new(nutrients.length,0)
  		nutrients.each_with_index do |nutrient,index|
   		  @cart_items.each do |cart_item|
	   			result= cart_item.food.contents.find_by(nut_type: nutrient)
		   			if result.present?
		   			total[index]=total[index]+result.nut_size/reference[index]*100
		   			end
	 		  end
		  end
      
      @vitamin_hash = Hash[vitamins_labels.zip total]


      #Minerals

      minerals_string = 
                ["Calcium, Ca",
  
                  "Copper, Cu",

                  "Iron, Fe",
                  "Magnesium, Mg",
                  "Manganese, Mn",
  
                  "Phosphorus, P",
                  "Selenium, Se",
                  "Zinc, Zn"]
      #Reference RDI for 18-30yr old male         
      minerals_reference = [1000,0.900,8,400,2.3,700,55,11]
      minerals_labels = 
                ["Calcium",
               
                  "Copper",
               
                  "Iron",
                  "Magnesium",
                  "Manganese",
                 
                  "Phosphorus",
                  "Selenium",
                  "Zinc"]
                          

      nutrients = minerals_string
      reference = minerals_reference
      total=nil
      total = Array.new(nutrients.length,0)
      nutrients.each_with_index do |nutrient,index|
        @cart_items.each do |cart_item|
          result= cart_item.food.contents.find_by(nut_type: nutrient)
            if result.present?
            total[index]=total[index]+result.nut_size/reference[index]*100
            end
        end
      end
      
      @mineral_hash = Hash[minerals_labels.zip total]


#Macros

      macros_string = 
                ["Carbohydrate, by difference",
                  "Fiber, total dietary",
                  "Protein",
                  "Total lipid (fat)"]
      #Reference RDI for 18-30yr old male         
      macros_reference = [1,1,1,1]
      macros_labels = 
                ["Carbs+Fiber",
                  "Fiber",
                  "Protein",
                  "Fats",
                  "Calories"]
                          

      nutrients = macros_string
      reference = macros_reference
      total=nil
      total = Array.new(nutrients.length,0)
      nutrients.each_with_index do |nutrient,index|
        @cart_items.each do |cart_item|
          result= cart_item.food.contents.find_by(nut_type: nutrient)
            if result.present?
            total[index]=total[index]+result.nut_size/reference[index]
            end
        end
      end

      total[4]=(total[0]-total[1])*4+total[3]*9+total[2]*4
      @macro_hash = Hash[macros_labels.zip total]


#Evils

      evils_string = 
                ["Fatty acids, total trans",
                  "Fatty acids, total saturated",
                  "Cholesterol",
                  "Sodium, Na",
                  "Sucrose"]
      #Reference RDI for 18-30yr old male         
      evils_reference = [1,1,1000,1000,1]
      evils_labels = 
                ["Trans-Fats",
                  "Saturated Fats",
                  "Cholesterol",
                  "Salt",
                  "Sugar(Sucrose)"]
                          

      nutrients = evils_string
      reference = evils_reference
      total=nil
      total = Array.new(nutrients.length,0)
      nutrients.each_with_index do |nutrient,index|
        @cart_items.each do |cart_item|
          result= cart_item.food.contents.find_by(nut_type: nutrient)
            if result.present?
            total[index]=total[index]+result.nut_size/reference[index]
            end
        end
      end

      @evil_hash = Hash[evils_labels.zip total]







   #end checkout function     
   end




end