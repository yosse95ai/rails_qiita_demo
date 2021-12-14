class Company < ApplicationRecord
  self.primary_key = :company_code

  has_many :vendees, class_name: "Item", foreign_key: "vendor_id"
  has_many :manufacturees, class_name: "Item", foreign_key: "manufacturer_id"

  has_many :company_branches, dependent: :destroy
  has_many :branches, through: :company_branches

  belongs_to :prefecture, class_name: "Prefecture", optional: true
end
