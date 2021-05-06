class RemoveUniqueIndexFromSubscription < ActiveRecord::Migration[6.1]
  def change
    remove_index :subscriptions, :user_email, unique: true
  end
end
