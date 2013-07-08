class UrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    begin
      uri = URI.parse(value)
      resp = uri.kind_of?(URI::HTTP)
    rescue URI::InvalidURIError
      resp = false
    end
    unless resp == true
      record.errors[attribute] << (options[:message] || "is not an url")
    end
  end
end

class Userlink < ActiveRecord::Base
  attr_accessible :name, :url, :summary, :tag_list

  acts_as_taggable

  validates :name, :url, presence: true
  validates :url, url: true
  validates_uniqueness_of :url, :shorturl
  

  def self.generate_shorturl
    rand(10000000)
  end
end

