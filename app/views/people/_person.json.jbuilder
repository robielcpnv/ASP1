json.extract! person, :id, :firstname, :lastname, :email, :phone, :type_person, :created_at, :updated_at
json.url person_url(person, format: :json)
