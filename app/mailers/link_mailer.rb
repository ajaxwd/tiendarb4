class LinkMailer < ActionMailer::Base
	default from: "download@tienda.com"

	def download_link(link)
		@link = link
		mail(to: link.email,subject:"Descargar los productos que adquiriste en la tienda")
	end
end