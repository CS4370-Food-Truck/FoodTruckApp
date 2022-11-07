class CreatePushSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :push_subscriptions do |t|
      t.string :subscription
      t.string :trucks

      t.timestamps
    end
  end
end
