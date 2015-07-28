class SorceryActivityLogging < ActiveRecord::Migration
  def change
    add_column :patients, :last_login_at,     :datetime, :default => nil
    add_column :patients, :last_logout_at,    :datetime, :default => nil
    add_column :patients, :last_activity_at,  :datetime, :default => nil
    add_column :patients, :last_login_from_ip_address, :string, :default => nil

    add_index :patients, [:last_logout_at, :last_activity_at]

    add_column :doctors, :last_login_at,     :datetime, :default => nil
    add_column :doctors, :last_logout_at,    :datetime, :default => nil
    add_column :doctors, :last_activity_at,  :datetime, :default => nil
    add_column :doctors, :last_login_from_ip_address, :string, :default => nil

    add_index :doctors, [:last_logout_at, :last_activity_at]
  end
end