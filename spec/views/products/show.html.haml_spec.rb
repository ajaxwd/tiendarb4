require 'rails_helper'

RSpec.describe "products/show", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      :name => "Name",
      :pricing => "Pricing",
      :decimal => "Decimal",
      :description => "MyText",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Pricing/)
    expect(rendered).to match(/Decimal/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
