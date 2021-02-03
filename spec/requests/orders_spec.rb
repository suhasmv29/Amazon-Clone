 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/orders", type: :request do
  # Order. As you add validations to Order, be sure to
  # adjust the attributes here as well.
  # let(:valid_attributes) {
  #   skip("Add a hash of attributes valid for your model")
  # }

  # let(:invalid_attributes) {
  #   skip("Add a hash of attributes invalid for your model")
  # }
  let!(:user) { create(:user) }
  before do
    sign_in(user) # Factory Bot user
  end


  describe "GET /index" do
    context 'When user has signed in' do

      
      it "renders a successful response" do
        order = create(:order, user_id: user.id, email: user.email)
        get orders_url
        expect(response).to be_successful
      end
    end   
  end

  describe "GET /show" do
    context 'when user has signed to display' do
      it "renders a successful response" do
        order = create(:order, user_id: user.id, email: user.email)
        get order_url(order)
        expect(response).to be_successful
      end
    end
    
  end

  describe "GET /new" do
    context 'User must signed in' do

      it "renders a successful response" do

        get new_order_url
        expect(response).to redirect_to(store_index_path)
        expect(flash[:notice]).to match(/Your cart is empty*/)

      end
      it "should get new" do
        category = create(:category)
        product = create(:product, category_id: category.id)
        post line_items_url, params: { product_id: product.id }
        get new_order_url
        assert_response :success
      end
      
    end 
    
  end

  describe "GET /edit" do
    context 'User signed in' do


      it "render a successful response" do
        order = create(:order, user_id: user.id, email: user.email)
        get edit_order_url(order)
        expect(response).to be_successful
      end
      
    end
  end

  describe "POST /create" do
    context "with valid parameters" do

      order_attributes = FactoryBot.attributes_for(:order)

      it "creates a new Order" do


        expect {
          order = build(:order, user_id: user.id, email: user.email)

          post orders_url, params: { order: { address: order.address,
            email: order.email, name: order.name,
            pay_type: order.pay_type } }
        }.to change(Order, :count).by(1)
      end

      it "redirects to the created order" do
        order = build(:order, user_id: user.id, email: user.email)

        post orders_url, params: { order: { address: order.address,
          email: order.email, name: order.name,
          pay_type: order.pay_type } }
        expect(response).to redirect_to(new_charge_path)
      end
    end

    context "with invalid parameters" do

      it "does not create a new Order" do
        expect {
          order = build(:order, user_id: user.id, email: user.email)

          post orders_url, params: { order: { address: order.address,
            email: order.email, name: order.name } }
        }.to change(Order, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        order = build(:order, user_id: user.id, email: user.email)

        post orders_url, params: { order: { address: order.address,
          email: order.email, name: order.name } }
        expect(response).to be_successful
        expect(response).to render_template(:new)
      end
      it "renders to new page " do
        order = build(:order, user_id: user.id, email: user.email)

        post orders_url, params: { order: { address: order.address,
          email: order.email, name: order.name } }
        expect(response).to render_template(:new)
      end

    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      # let(:new_attributes) {
      #   skip("Add a hash of attributes valid for your model")
      # }


      it "updates the requested order" do
        order = create(:order, user_id: user.id, email: user.email)
        patch order_url(order),params: { order: { address: order.address,
          email: order.email, name: order.name,
          pay_type: order.pay_type } }
        order.reload
      end

      it "redirects to the order" do
        order = create(:order, user_id: user.id, email: user.email)
        patch order_url(order), params: { order: { address: order.address,
          email: order.email, name: order.name,
          pay_type: order.pay_type } }
        order.reload
        expect(response).to redirect_to(order_url(order))
      end
    end

    # context "with invalid parameters" do
    #   let!(:user) { create(:user) }

    #   before do
    #     sign_in(user) # Factory Bot user

    #   end
    #   it "renders a successful response (i.e. to display the 'edit' template)" do
    #     order = create(:order, user_id: user.id, email: user.email)
    #     patch order_url(order),params: { order: { address: order.address,
    #       email: order.email, name: order.name,
    #       pay_type: order.pay_type } }
    #     expect(response).to be_successful
    #   end
    # end
  end

  describe "DELETE /destroy" do
    context 'when user has signed in' do

      it "destroys the requested order" do
        order = create(:order, user_id: user.id, email: user.email)
        expect {
          delete order_url(order)
        }.to change(Order, :count).by(-1)
      end
  
      it "redirects to the orders list" do
        order = create(:order, user_id: user.id, email: user.email)
        delete order_url(order)
        expect(response).to redirect_to(orders_url)
      end
    end
    
  end
end
