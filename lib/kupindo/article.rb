require 'date'
require_relative 'base'

class Kupindo
  class Article
    include Base

    string_attrs :article_name, :article_url, :municipality, :region, :seller, :description
    int_attrs :price, :article_id

  end
end
