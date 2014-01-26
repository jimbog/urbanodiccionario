json.array!(@words) do |word|
  json.extract! word, :id, :name, :definition, :example
  json.url word_url(word, format: :json)
end
