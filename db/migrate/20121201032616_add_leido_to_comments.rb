class AddLeidoToComments < ActiveRecord::Migration
  def change
    add_column :comments, :leido, :boolean, default: false
  end
end
