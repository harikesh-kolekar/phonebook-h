class CreateMcsInfos < ActiveRecord::Migration
  def change
    create_table :mcs_infos do |t|
      t.string :info_type
      t.attachment :attachment

      t.timestamps null: false
    end
  end
end
