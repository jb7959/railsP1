require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
    #test code adding - 2015_04_17, update라는 배열을 만든 후에, 각각의 테스트 메소드의 product를 변경해줬다.
    @update = {
      title: 'Lorem Ipsum',
      description: 'testtest!',
      image_url: 'dodo.jpg',
      price: 19.95
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end
  #test code adding - 2015_04_17
  test "should create product" do
    assert_difference('Product.count') do
      #post :create, product: { description: @product.description, image_url: @product.image_url, price: @product.price, title: @product.title }
      post :create, product: @update
      
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end
  #test code adding - 2015_04_17
  test "should update product" do
    #patch :update, id: @product, product: { description: @product.description, image_url: @product.image_url, price: @product.price, title: @product.title }
    #assert_redirected_to product_path(assigns(:product))
    patch :update, id: @product, product: @update
    assert_redirected_to product_path(assigns(:product))
    
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
end
