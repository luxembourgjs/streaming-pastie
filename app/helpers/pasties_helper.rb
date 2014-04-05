module PastiesHelper
  def image_url_or_nil pastie
    return image_url(pastie) if pastie.image

    nil
  end
end
