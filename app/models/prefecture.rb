class Prefecture < ApplicationRecord
  has_many :company_branches, dependent: :destroy
  has_many :branches, through: :company_branches

  has_many :headees, class_name: "Company"
end
