require 'bundler'
require 'rubygems'
require 'open-uri'
require 'nokogiri'
require 'json'
require 'pp'

	

	def get_the_email_of_a_townhal_from_its_webpage(urls, names)
		#Creation bases emails et noms de mairies
		emails=[]
		mairies=[]

		urls.each do |url|
		
			doc = Nokogiri::HTML(open(url))
			a=doc.xpath('//p[@class="Style22"]/font[@size="2"]')
			email= a[10].text
			emails<<email
		end
		
		mairies = names.zip(emails).map {|name,email| {:name==>name, :email==>email}}
		
		#Mairies sous formes de array pour simplifier l'extraction json et csv
		mairies2 = names.zip(emails).map {|name,email| [name, email]}
		
		File.open("mairies27.json","w") do |f|
		f.write(mairies2.to_json)
		end

		#liaison avec le spreadsheet sur mon googlr Drive
		#Bundler.require
		#session = GoogleDrive::Session.from_service_account_key("config.json")
		#spreadsheet = session.spreadsheet_by_title("mairies_27")
		#worksheet = spreadsheet.worksheets.first

		#Ecriture sur spreadsheet
		#mairies2.each do |name,email|
		#worksheet.insert_rows(worksheet.num_rows + 1, [[name, email]])
		#worksheet.save
		#end

	end


		

	def get_all_the_urls_of_eure_townhalls ()
		
		doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/eure.html"))
		
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

	

get_all_the_urls_of_eure_townhalls()



