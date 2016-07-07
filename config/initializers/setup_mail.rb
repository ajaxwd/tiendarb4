ActionMailer::Base.smtp_settings = {
	address: "smtp.gmail.com",
	port: 587,
	domain: "gmail.com",
	user_name: "a@gmail.com",
	password: "asdsadfasd",
	authentication: :login,
	enable_starttls_auto: true
}