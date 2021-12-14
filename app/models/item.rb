class Item < ApplicationRecord
  belongs_to :vendor, class_name: "Company", optional: true
  belongs_to :manufacturer, class_name: "Company", optional: true

  has_many :user_havings, dependent: :destroy, foreign_key: "having_id"
  has_many :had_users, through: :user_havings, source: :user
  
  has_many :user_wishlists, dependent: :destroy, foreign_key: "wishlist_id"
  has_many :wished_users, through: :user_wishlists, source: :user
end
