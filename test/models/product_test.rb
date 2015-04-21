require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  ##유닛테스트 추가 2015.4.17
  test "product attribute must not be empty" do 
    product = Product.new #controller에서 만드는 프로덕트 인스턴스
    #assert 메소드는 참이기를 기대하는 메소드
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
    
  end
  
  test "product price must be positive" do
  product = Product.new(title: "My Book Title", description: "yyy", image_url: "zzz.jpg")
  
  product.price = -1 #상품가격 -1을 줘서 검증
  assert product.invalid? #검증수행
  assert_equal "must be greater_than_or_equal_to 0.01", product.errors[:price].join('; ') #실패하면 메세지 전송
  
  product.price = 0#상품가격 0을 줘서 검증
  assert product.invalid?
  assert_equal "must be greater_than_or_equal_to 0.01", product.errors[:price].join('; ') 
  
  product.price = 1 #상품가격 1을 줘서 검증
  assert product.invalid?
  
  
  
  end
  
  
end
