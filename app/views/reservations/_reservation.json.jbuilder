json.extract! reservation, :id, :from, :till, :employee_id, :bike_id, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
