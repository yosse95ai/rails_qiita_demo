class UserWishlist < ApplicationRecord
  belongs_to :wishlist, class_name: 'Item'
  belongs_to :user
end
