# == Schema Information
#
# Table name: products
#
#  id                  :integer          not null, primary key
#  name                :string
#  pricing             :integer
#  decimal             :string
#  description         :text
#  user_id             :integer
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Product < ActiveRecord::Base
  belongs_to :user
  has_many :attachments
  has_many :in_shopping_carts
  has_one :shopping_cart, through: :in_shopping_carts
  has_many :my_payments, through: :shopping_cart

  validates_presence_of :name,:user,:pricing
  validates :pricing, numericality: { greater_than: 0}

  has_attached_file :avatar, style: { medium: "300x300", thumb: "100x100" },default_url: "missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def paypal_from
  	{name: name, sku: :item, price: (pricing / 100), currency:"USD",quanity:1 }
  end

  def sales
  	my_payments.payed
  end

  def sales_total
  	my_payments.payed.count * self.pricing
  end

end
