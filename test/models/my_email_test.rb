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

require 'test_helper'

class MyEmailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
