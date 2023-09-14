class RevertConfirmableFromUsers < ActiveRecord::Migration[7.0]
  def up
    remove_columns :users, :confirmation_token, :confirmed_at, :confirmation_sent_at, :unconfirmed_email
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end