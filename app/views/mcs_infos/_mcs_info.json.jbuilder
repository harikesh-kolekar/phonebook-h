json.extract! mcs_info, :id, :info_type, :attachment, :created_at, :updated_at
json.url mcs_info_url(mcs_info, format: :json)
