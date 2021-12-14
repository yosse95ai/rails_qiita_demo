class CreateUserHavings < ActiveRecord::Migration[6.1]
  def change
    create_table :user_havings do |t|
      t.references :having, foreign_key: { to_table: :items }
      t.references :user, foreign_key: true
    end
  end
end
