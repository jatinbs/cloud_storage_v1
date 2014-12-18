json.array!(@test_objects) do |test_object|
  json.extract! test_object, :id, :title
  json.url test_object_url(test_object, format: :json)
end
