class Userlink < ActiveRecord::Base
  attr_accessible :name, :shorturl, :url
end
