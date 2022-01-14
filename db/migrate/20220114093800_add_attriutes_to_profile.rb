class AddAttriutesToProfile < ActiveRecord::Migration
  def change
  	 add_column :profiles, :date_of_joining_cadra, :date
  	 add_column :profiles, :past_postings, :text
  	 add_column :profiles, :additional_info, :text
  	 add_column :profiles, :achievements, :text
  	 add_column :users, :date_of_joining_cadra, :date
  	 add_column :users, :past_postings, :text
  	 add_column :users, :additional_info, :text
  	 add_column :users, :achievements, :text
  end
end
