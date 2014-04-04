json.extract! @pastie, :id, :text
json.created_at = "#{time_ago_in_words(@pastie.created_at)} ago"
json.image_url = image_url(@pastie)
