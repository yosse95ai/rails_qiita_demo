class CreateCompanyBranches < ActiveRecord::Migration[6.1]
  def change
    create_table :company_branches do |t|
      t.references :prefecture, foreign_key: true
      t.references :company, type: :string
    end
    add_foreign_key :company_branches, :companies, column: :company_id, primary_key: :company_code
  end
end
