require 'fileutils'
module Background
	class BackupLog
		def self.copylog
			from_dir = "#{Dir.pwd}/log"
			to_dir = "#{from_dir}/backup_#{Time.now.strftime('%Y_%m_%d')}/"
			p "Folde Present" and return false if File.directory?(to_dir)
			contains = Dir.new(from_dir).entries
			FileUtils.mkdir_p(File.dirname(to_dir))
			contains.select!{|c| c.include?(".log")}
			contains.each do |f|
				 p "cp -R #{from_dir}/#{f} #{to_dir}"
				system "cp -R #{from_dir}/#{f} #{to_dir}"
			end
		end
	end
end
