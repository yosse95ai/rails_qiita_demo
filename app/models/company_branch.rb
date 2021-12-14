class CompanyBranch < ApplicationRecord
  belongs_to :branch, class_name: "Prefecture", foreign_key: :prefecture_id
  belongs_to :company
end
