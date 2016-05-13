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
