# == Schema Information
#
# Table name: my_emails
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  ip         :string(255)
#  state      :integer
#  created_at :datetime
#  updated_at :datetime
#

class MyEmail < ActiveRecord::Base
	validates_presence_of :email, message: "Woop! te falta el email"
	validates_uniqueness_of :email, message: "Woop! email repetido"
	validates_format_of :email, with: Devise::email_regexp, message: "No enviaste un correo"
end
