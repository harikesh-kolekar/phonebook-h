node(:number_of_pages) { @profiles.total_pages }
node(:number_of_profiles) { @profiles.total_entries }
node(:number_of_notifications) { @notification_count }
child @profiles do
	attributes :id, :name, :designation, :education, :phone_no, :mobile_no1, :mobile_no2, :home_taluka, :present_post, :posting_taluka, :batch, :other_info, :past_postings, :additional_info, :achievements, :home_district, :posting_district, :email, :date_of_joining_cadra,: date_of_birth, :date_of_join_dept, :posting_date
		node(:date_of_birth) { |m| date_to_string(m.date_of_birth)}
		node(:date_of_join_dept) { |m| date_to_string(m.date_of_join_dept)}
		node(:posting_date) { |m| date_to_string(m.posting_date)}
		node(:date_of_joining_cadra) { |m| date_to_string(m.date_of_joining_cadra)}
		node(:medium_photo) { |m| m.photo.url(:medium)}
		node(:medium_icard) { |m| m.icard.url(:medium)}
end