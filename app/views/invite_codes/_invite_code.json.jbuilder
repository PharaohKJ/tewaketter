json.extract! invite_code, :id, :config_id, :code, :start, :finish, :created_at, :updated_at
json.url invite_code_url(invite_code, format: :json)
