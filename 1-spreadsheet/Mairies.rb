require 'bundler'
require 'rubygems'
require 'open-uri'
require 'nokogiri'
require 'json'
require 'pp'

	

	def get_the_email_of_a_townhal_from_its_webpage(urls, names)
		
		emails=[]
		mairies=[]
		urls.each do |url|
		
			doc = Nokogiri::HTML(open(url))
			a=doc.xpath('//p[@class="Style22"]/font[@size="2"]')
			email= a[10].text
			emails<<email
		end
		
		mairies = names.zip(emails).map {|name,email| {:name==>name, :email==>email}}
		mairies2 = names.zip(emails).map {|name,email| [name, email]}
		

		#puts mairies2
		Bundler.require
		session = GoogleDrive::Session.from_service_account_key("config.json")
		spreadsheet = session.spreadsheet_by_title("Mairies_Liste")
		worksheet = spreadsheet.worksheets.first

		mairies2.each do |name,email|
		worksheet.insert_rows(worksheet.num_rows + 1, [[name, email]])
		worksheet.save
		end

		#File.open("/home/adeline/Documents/Formation/Thp/3_Semaine3/1-spreadsheet/mairie2_json.json","w") do |f|
		#f.write(mairies2.to_json)
		#end
		
	end
		

	def get_all_the_urls_of_val_doise_townhalls ()
		doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise"))
		urls = []
		names=[]
		doc.xpath('//a[@class="lientxt"]/@href').each do |node|
		  longueur = node.text.length
		  url1 = node.text
		  
		  url2= "http://annuaire-des-mairies.com#{url1[1..longueur-6]}"
		  
			urls<<url2
		end

		doc.xpath('//a[@class="lientxt"]').each do |node|
		  name = node.text
		   names<<name
		end

		get_the_email_of_a_townhal_from_its_webpage(urls, names)
	end

	

get_all_the_urls_of_val_doise_townhalls()



