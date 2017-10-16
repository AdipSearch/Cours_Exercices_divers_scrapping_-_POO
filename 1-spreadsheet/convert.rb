require 'csv'
require 'json'

CSV.open("Mairiescsv.csv", "w") do |csv| #open new file for write
  JSON.parse(File.open("mairie2_json.json").read).each do |hash| #open json to parse
    csv << hash #write value to file
  end
end