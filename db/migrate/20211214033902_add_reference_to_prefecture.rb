class AddReferenceToPrefecture < ActiveRecord::Migration[6.1]
  def change
    add_reference :companies, :prefecture, foreign_key: true
  end
end
