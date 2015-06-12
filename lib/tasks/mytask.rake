desc "Imports food db"
task :mytask=> :environment do
  require 'csv'
  Food.delete_all 
  Content.delete_all

  csv_text = File.read(Rails.root.join('lib', 'tasks',  'seed.csv'), :encoding => 'iso-8859-1')
  csv = CSV.parse(csv_text, :headers => true)

  csv.each do |row|

  if Food.exists?(:name => row[0])
  	@food=Food.find_by_name(row[0]) 
  else
	@food=Food.create!({
		:name => row[0],
		:serve_size => row[3]+" "+row[4]})

  end

  	@food.contents.create!({

      :nut_type=> row[1],
      :nut_size => row[2].to_f * row[5].to_f/100

     })

      
  end
end
