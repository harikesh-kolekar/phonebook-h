collection @mcs_infos
attributes :id, :info_type
node(:attachment) { |m| m.attachment.url }
