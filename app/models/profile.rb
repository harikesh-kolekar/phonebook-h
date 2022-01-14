# == Schema Information
#
# Table name: profiles
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  designation        :string(255)
#  education          :string(255)
#  phone_no           :string(255)
#  mobile_no1         :string(255)      default(""), not null
#  mobile_no2         :string(255)
#  email              :string(255)
#  home_taluka_id     :string(255)
#  date_of_birth      :date
#  date_of_join_dept  :date
#  posting_date       :date
#  present_post       :string(255)
#  home_taluka        :string(255)      default("NA")
#  home_district      :string(255)      default("NA")
#  posting_district   :string(255)      default("NA")
#  posting_taluka     :string(255)      default("NA")
#  batch              :string(255)
#  other_info         :string(255)
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#  icard_file_name    :string(255)
#  icard_content_type :string(255)
#  icard_file_size    :integer
#  icard_updated_at   :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :integer
#

class Profile < ActiveRecord::Base

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: ActionController::Base.helpers.asset_path("profile.png")
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
  has_attached_file :icard, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: ActionController::Base.helpers.asset_path("i-card.png")
  validates_attachment_content_type :icard, content_type: /\Aimage\/.*\Z/
  after_destroy :add_deleted_record
  self.per_page = 100
  
	def self.import(file)
	position =    {'Full Name' => 0,
 'Email' => 1,
 'Mobile 1' => 2,
 'Mobile 2' => 3,
 'DOB' => 4,
 'Education' => 5,
 'Designation' => 6,
 'Present Post' => 7,
 'Posting Dist' => 8,
 'Posting Taluka' => 9,
 'Home Dist' => 10,
 'Home Taluka' => 11,
 'Joining date' => 12,
 'Posting Date' => 13,
 'Date Of Joining Present Cadre' => 14,
 'Past Positions' => 15,
 'Achievements/ Awards/ Notable work done' => 16,
 'Additional Info' => 17}

	workbook = RubyXL::Parser.parse(file)
	worksheet = workbook.worksheets[0]
  not_saved = []
  is_nil = 0
  row = 0
  worksheet.each do |i|
    row = row + 1
    if i.nil? || i.size == 0
      is_nil<5 ? is_nil = is_nil+1 : break
      next
    end
    is_nil = 0
    next if i[0]&.value == "Full Name"
    begin
      if(i[position['Mobile 1']]&.value.to_s.blank? && i[position['Mobile 2']]&.value.to_s.blank? && i[position['Email']]&.value.to_s.blank? && i[position['Designation']]&.value.to_s.blank? && i[position['Posting Dist']]&.value.to_s.blank? && i[position['Home Dist']]&.value.to_s.blank? && i[position['DOB']]&.value.to_s.blank? )
        next
      end
      if(i[position['Mobile 1']]&.value.to_s.blank? && i[position['Mobile 2']]&.value.to_s.blank? && i[position['Email']]&.value.to_s.blank?)
        not_saved << row
      next
      end  

      u = Profile.find_by_email(i[position['Email']]&.value.to_s) unless i[position['Email']]&.value.to_s.blank?
      if u 
      elsif (!i[position['Mobile 1']]&.value.to_s.blank? && get_user(i[position['Mobile 1']]&.value.to_s)) 
        u = get_user(i[position['Mobile 1']]&.value.to_s)
      elsif (!i[position['Mobile 2']]&.value.to_s.blank? && get_user(i[position['Mobile 2']]&.value.to_s))
        u = get_user(i[position['Mobile 2']]&.value.to_s)
      else
        u = Profile.new()
      end
      u.name = i[position['Full Name']]&.value.to_s
      u.designation = i[position['Designation']]&.value.to_s
      if i[position['Mobile 1']]&.value.to_s.blank?
      		u.mobile_no1 = i[position['Mobile 2']]&.value.to_s
      else
      	u.mobile_no1 = i[position['Mobile 1']]&.value.to_s
      	u.mobile_no2 = i[position['Mobile 2']]&.value.to_s
      end
      u.email = i[position['Email']]&.value.to_s
      u.posting_district = i[position['Posting Dist']]&.value.to_s
      u.home_district = i[position['Home Dist']]&.value.to_s
      u.date_of_birth = self.convert_string_to_date i[position['DOB']]&.value.to_s
      u.date_of_join_dept = self.convert_string_to_date i[position['Joining date']]&.value.to_s
      u.posting_date = self.convert_string_to_date i[position['Posting Date']]&.value.to_s
      u.date_of_joining_cadra = self.convert_string_to_date i[position['Date Of Joining Present Cadre']]&.value.to_s
      u.past_postings = i[position['Past Positions']]&.value.to_s
      u.achievements = i[position['Achievements/ Awards/ Notable work done']]&.value.to_s
      u.additional_info = i[position['Additional Info']]&.value.to_s
      u.home_taluka = i[position['Home Taluka']]&.value.to_s
      u.posting_taluka = i[position['Posting Taluka']]&.value.to_s
      u.education = i[position['Education']]&.value.to_s
      u.present_post = i[position['Present Post']]&.value.to_s
      u.save!
    rescue Exception => e
      pp e
      begin
        p "Mobile 1 = #{i[position['Mobile 1']]&.value.to_s}"
        p "Mobile 2 = #{i[position['Mobile 2']]&.value.to_s}"
        p "email = #{i[position['Email']]&.value.to_s}"
        p "posting_district = #{i[position['Posting Dist']]&.value.to_s}"
        p "home_district = #{i[position['Home Dist']]&.value.to_s}"
        p "date_of_birth = #{self.convert_string_to_date i[position['DOB']]&.value.to_s}"
        p "date_of_join_dept = #{self.convert_string_to_date i[position['Joining date']]&.value.to_s}"
        p "posting_date = #{self.convert_string_to_date i[position['Posting Date']]&.value.to_s}"
        p "date_of_joining_cadra = #{self.convert_string_to_date i[position['Date Of Joining Present Cadre']]&.value.to_s}"
        p "past_postings = #{i[position['Past Positions']]&.value.to_s}"
        p "achievements = #{i[position['Achievements/ Awards/ Notable work done']]&.value.to_s}"
        p "additional_info = #{i[position['Additional Info']]&.value.to_s}"
        p "home_taluka = #{i[position['Home Taluka']]&.value.to_s}"
        p "posting_taluka = #{i[position['Posting Taluka']]&.value.to_s}"
        p "education = #{i[position['Education']]&.value.to_s}"
        p "present_post = #{i[position['Present Post']]&.value.to_s}"
      rescue Exception => e
      end
      not_saved << row
    end
  end
  return not_saved
end
 
def self.get_deleted_record_ids
  (1..Profile.maximum('id')).to_a - (Profile.all.collect(&:id))
end

def add_deleted_record
  $get_deleted_record_ids = Profile.get_deleted_record_ids unless $get_deleted_record_ids
  $get_deleted_record_ids << self.id
end

def self.get_user(mobile)
      Profile.where(user_id: nil).where("mobile_no1=? or mobile_no2=? ",mobile, mobile).first
    end
    def self.convert_string_to_date(str)
		Date.strptime(str,"%d/%m/%Y") rescue ""
	end
	def mobile_nos
	  	if self.mobile_no2.blank?
	  		return self.mobile_no1
	  	else
	  		return self.mobile_no1 + "/ " + self.mobile_no2
	  	end
	  end
end
