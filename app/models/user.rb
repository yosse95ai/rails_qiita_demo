class User < ApplicationRecord  
  has_many :user_havings, dependent: :destroy
  has_many :havings, through: :user_havings
  
  has_many :user_wishlists, dependent: :destroy
  has_many :wishlists, through: :user_wishlists

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships, source: :friend
  has_many :my_friendships, class_name: "Friendship", foreign_key: "friend_id", dependent: :destroy
  has_many :users, through: :my_friendships, source: :user

  def friending(friend)
    unless self == friend
      self.friendships.find_or_create_by(friend_id: friend.id)
    end
  end

  def unfriending(friend)
    friendship_to = self.friendships.find_by(friend_id: friend.id)
    friendship_to.destroy if friendship_to
  end
end

