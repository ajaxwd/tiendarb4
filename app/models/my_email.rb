class MyEmail < ActiveRecord::Base
	validates_presence_of :email, message: "Woop! te falta el email"
	validates_uniqueness_of :email, message: "Woop! email repetido"
	validates_format_of :email, with: Devise::email_regexp, message: "No enviaste un correo"
end
