require 'gmail'
require 'json'



def send_email_to_line(name,email)
	Gmail.connect(ENV["EMAIL_ADRESS"],ENV["EMAIL_PASS"]) do |gmail|
	gmail.deliver do
	  to "#{email}"
	  subject "The Hacking Project: Proposez une formation gratuite de qualité aux citoyens"
	  	
	  text_part do
	   	body "Bonjour,
		Je m'appelle Adeline, je suis élève à une formation de code gratuite, ouverte à tous, sans restriction géographique, ni restriction de niveau. La formation s'appelle The Hacking Project (http://thehackingproject.org/). Nous apprenons l'informatique via la méthode du peer-learning : nous faisons des projets concrets qui nous sont assignés tous les jours, sur lesquels nous planchons en petites équipes autonomes. Le projet du jour est d'envoyer des emails à nos élus locaux pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation gratuite.

		Nous vous contactons pour vous parler du projet, et vous dire que vous pouvez ouvrir une cellule à #{name}, où vous pouvez former gratuitement 6 personnes (ou plus), qu'elles soient débutantes, ou confirmées. Le modèle d'éducation de The Hacking Project n'a pas de limite en terme de nombre de moussaillons (c'est comme cela que l'on appelle les élèves), donc nous serions ravis de travailler avec #{name} !

		Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80"
	  end
	end
  puts gmail.logged_in?
end
end

def read_json()
	

	json = File.read('mairies27.json')
	obj = JSON.parse(json)

	go_through_lines(obj)
end

def go_through_lines(obj)

	obj.each do |name,email|
		send_email_to_line(name,email)
	end
	
end

read_json()