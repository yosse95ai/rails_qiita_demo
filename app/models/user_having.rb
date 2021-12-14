class UserHaving < ApplicationRecord
  belongs_to :having, class_name: 'Item'
  belongs_to :user
end
