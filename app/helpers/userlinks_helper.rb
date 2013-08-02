require 'uri'
module UserlinksHelper
  def geturl(url)
    URI.parse(url).host
  end
end
