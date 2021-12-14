class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name, null: false

      t.references :vendor, type: :string
      t.references :manufacturer, type: :string

      t.timestamps
    end
    add_foreign_key :items, :companies, column: :vendor_id, primary_key: :company_code
    add_foreign_key :items, :companies, column: :manufacturer_id, primary_key: :company_code
  end
end
