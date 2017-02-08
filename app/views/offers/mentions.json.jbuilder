json.post do |json|
  json.array! @offer.mentions, :id, :text, :user
end
