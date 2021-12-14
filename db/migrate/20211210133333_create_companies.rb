class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies, id: false do |t|
      t.string :company_code, null: false, primary_key: true
      t.string :name
      t.string :address
      t.string :mail
      t.string :phone

      t.timestamps
    end
  end
end
