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

require 'rails_helper'

RSpec.describe MyEmail, type: :model do
  it{ should validate_presence_of(:email).with_message("Woop! te falta el email")}
  it{ should validate_uniqueness_of(:email).with_message("Woop! email repetido")}

  it "should not create with invalid email" do
  	email = MyEmail.new(email:"adrian")
  	expect(email.valid?).to be_falsy
  end

  it "should not create with invalid email" do
  	email = MyEmail.new(email:"adrian@gmail.com")
  	expect(email.valid?).to be_truthy
  end
end
