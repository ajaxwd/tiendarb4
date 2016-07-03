# == Schema Information
#
# Table name: links
#
#  id              :integer          not null, primary key
#  product_id      :integer
#  espiration_date :datetime
#  downloads       :integer
#  downloads_limit :integer
#  custom_id       :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  email           :string
#

require 'rails_helper'

RSpec.describe Link, type: :model do
  it{should belong_to :product}

  it "should generate a custom_id" do
  	link = FactoryGirl.create(:link)

  	expect(link.custom_id).to_not be_empty
  end

  it "should send an email" do
  	expect{
  		FactoryGirl.create(:link)
  	}.to change(ActionMailer::Base.deliveries,;count).by(1)
  end


end