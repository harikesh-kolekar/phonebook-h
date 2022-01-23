class McsInfo < ActiveRecord::Base
    has_attached_file :attachment
  validates_attachment_content_type :attachment, content_type: [/\Aimage\/.*\Z/, 'application/pdf', 'application/msword', 'text/plain']
  def file_attached?
	  self.pdf.file?
  end
end
