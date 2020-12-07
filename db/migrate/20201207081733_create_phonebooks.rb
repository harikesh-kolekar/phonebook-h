class CreatePhonebooks < ActiveRecord::Migration
  def change
    create_table :phonebooks do |t|
      t.string :name
      t.string :phone

      t.timestamps null: false
    end
  end
end
