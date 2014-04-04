json.array!(@pasties) do |pastie|
  json.extract! pastie, :id, :text, :created_at
  json.image_url = image_url(pastie)
end
