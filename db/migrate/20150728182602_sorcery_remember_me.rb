class SorceryRememberMe < ActiveRecord::Migration
  def change
    add_column :patients, :remember_me_token, :string, :default => nil
    add_column :patients, :remember_me_token_expires_at, :datetime, :default => nil

    add_index :patients, :remember_me_token

    add_column :doctors, :remember_me_token, :string, :default => nil
    add_column :doctors, :remember_me_token_expires_at, :datetime, :default => nil

    add_index :doctors, :remember_me_token
  end
end