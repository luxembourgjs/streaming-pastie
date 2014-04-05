json.id @pastie._id.to_s
json.extract! @pastie, :text
json.created_at "#{time_ago_in_words(@pastie.created_at)} ago"
json.image_url image_url_or_nil(@pastie)
