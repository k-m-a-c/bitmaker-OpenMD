class RemoveInviteeFromRelationships < ActiveRecord::Migration
  def change
    remove_column :relationships, :inviter, :text
    remove_column :relationships, :invitee, :text
    remove_column :relationships, :status, :text

    add_column :relationships, :inviter, :string, null: false
    add_column :relationships, :status, :string, null: false
  end
end
