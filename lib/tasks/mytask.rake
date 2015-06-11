desc "Imports food db"
task :mytask=> :environment do
  require 'csv'
  FoodItem.delete_all 

  csv_text = File.read(Rails.root.join('lib', 'tasks',  'seed.csv'), :encoding => 'iso-8859-1')
  csv = CSV.parse(csv_text, :headers => true)


calciumstring= "Calcium; Ca"


  csv.each do |row|





		FoodItem.create!({



      :name => row[0],
      :serve_size => row[3]+" "+row[4],
      :nut_type=> row[1],
      :nut_size => row[2],

     })
      
  end
end
