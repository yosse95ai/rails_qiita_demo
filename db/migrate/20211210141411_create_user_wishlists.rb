class CreateUserWishlists < ActiveRecord::Migration[6.1]
  def change
    create_table :user_wishlists do |t|
      t.references :wishlist, foreign_key: { to_table: :items }
      t.references :user, foreign_key: true
    end
  end
end
