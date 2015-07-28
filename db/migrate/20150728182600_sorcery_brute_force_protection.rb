class SorceryBruteForceProtection < ActiveRecord::Migration
  def change
    add_column :patients, :failed_logins_count, :integer, :default => 0
    add_column :patients, :lock_expires_at, :datetime, :default => nil
    add_column :patients, :unlock_token, :string, :default => nil

    add_index :patients, :unlock_token

    add_column :doctors, :failed_logins_count, :integer, :default => 0
    add_column :doctors, :lock_expires_at, :datetime, :default => nil
    add_column :doctors, :unlock_token, :string, :default => nil

    add_index :doctors, :unlock_token
  end
end
