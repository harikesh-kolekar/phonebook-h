class CreatePresentPostings < ActiveRecord::Migration
  def change
    create_table :present_postings do |t|
      t.string :name
      t.integer :designation_id

      t.timestamps null: false
    end
  end
end
