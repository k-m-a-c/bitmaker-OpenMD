class SorceryResetPassword < ActiveRecord::Migration
  def change
    add_column :patients, :reset_password_token, :string, :default => nil
    add_column :patients, :reset_password_token_expires_at, :datetime, :default => nil
    add_column :patients, :reset_password_email_sent_at, :datetime, :default => nil

    add_index :patients, :reset_password_token

    add_column :doctors, :reset_password_token, :string, :default => nil
    add_column :doctors, :reset_password_token_expires_at, :datetime, :default => nil
    add_column :doctors, :reset_password_email_sent_at, :datetime, :default => nil

    add_index :doctors, :reset_password_token
  end
end