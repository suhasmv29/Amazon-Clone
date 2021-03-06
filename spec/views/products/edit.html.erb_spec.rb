require 'rails_helper'

RSpec.describe "products/edit", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      title: "MyString",
      description: "MyText",
      image_url: "MyString",
      price: "9.99",
      category: nil
    ))
  end

  it "renders the edit product form" do
    render

    assert_select "form[action=?][method=?]", product_path(@product), "post" do

      assert_select "input[name=?]", "product[title]"

      assert_select "textarea[name=?]", "product[description]"

      assert_select "input[name=?]", "product[image_url]"

      assert_select "input[name=?]", "product[price]"

      assert_select "input[name=?]", "product[category_id]"
    end
  end
end
