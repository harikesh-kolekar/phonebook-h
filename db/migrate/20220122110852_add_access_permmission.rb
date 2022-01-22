class AddAccessPermmission < ActiveRecord::Migration
  def change
     add_column :users, :access_permission, :text
  end
end
