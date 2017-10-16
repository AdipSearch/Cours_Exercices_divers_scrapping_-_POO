
require 'bundler'
require 'rubygems'
require 'json'
require 'pp'




def get_the_hash
	json = File.read('mairie2_json.json')
	obj = JSON.parse(json)

	#puts obj

	setup_spreadsheet(obj)
	
end

def setup_spreadsheet (obj)
Bundler.require
 
 #Authenticate a session with your Service Account
session = GoogleDrive::Session.from_service_account_key("config.json")
 
 #Get the spreadsheet by its title
spreadsheet = session.spreadsheet_by_title("Mairies_Liste")

worksheet = spreadsheet.worksheets.first

	obj.each do |name,email|
	worksheet.insert_rows(worksheet.num_rows + 1, [[name, email]])
	worksheet.save
	end

worksheet.export_as_file('home/adeline/Documents/Formation/Thp/3_Semaine3/1-spreadsheet/')

end

get_the_hash()


