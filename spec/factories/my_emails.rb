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

FactoryGirl.define do
  factory :my_email do
    email "MyString"
    ip "MyString"
    state 1
  end
end
