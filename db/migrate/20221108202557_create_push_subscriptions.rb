class CreatePushSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :push_subscriptions do |t|
      t.string :endpoint
      t.string :expirationTime
      t.json :keys
      t. :trucks #TODO: Change to array of integers.

      t.timestamps
    end
  end
end
