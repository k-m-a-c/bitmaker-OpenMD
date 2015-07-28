class SorceryCore < ActiveRecord::Migration
  def change
    add_column :patients, :crypted_password, :string
    add_column :patients, :salt, :string
    remove_index :patients, :email
    add_index :patients, :email, unique: true

    add_column :doctors, :crypted_password, :string
    add_column :doctors, :salt, :string
    remove_index :doctors, :email
    add_index :doctors, :email, unique: true
  end
end