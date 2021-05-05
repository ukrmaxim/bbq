class AddUniqueIndexToSubscription < ActiveRecord::Migration[6.1]
  def change
    add_index :subscriptions, :user_email, unique: true
  end
end
