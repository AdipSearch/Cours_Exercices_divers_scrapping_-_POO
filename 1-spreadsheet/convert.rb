require 'csv'
require 'json'

CSV.open("Mairiescsv.csv", "w") do |csv| #open new file for write
  JSON.parse(File.open("mairie2_json.json").read).each do |e| #open json to parse
    csv << e #write value to file
  end
end