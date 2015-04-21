class Product < ActiveRecord::Base

validates :title, :description, :image_url, presence: true # 공란이 없는지 검증
validates :price, numericality: {greater_than_or_equal_to: 0.01} # 가격이 0원 이상인지 검증
validates :title, uniqueness: true  # 제목이 유니크한지 검증
#이미지 확장자 제어
#validates :image_url, allow_blank: true, format: {
#    with: %r{\.(gif|jpg|png)$}i,
#    message: 'must be a URL for GIF, JPG or PNG image'
#}
end
