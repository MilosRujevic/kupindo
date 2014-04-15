require 'rest_client'

class Kupindo
  def initialize params
    @params = params
    @url = 'http://arkona.kupindo.com/REST/v1'
  end

  def get_user username
    rest_get User, '/User/Info', {:user_name => username}
  end

  def get_article id
    rest_get Article, '/Article/Details', {:article_id => id}
  end

  def rest_get klass, path, params
    response = RestClient.get @url + path, {:accept => :json, :params => @params.merge(params)}

    answer = JSON.parse(response)
    if error = answer['error']
      raise "Kupindo error: #{error['name']} - #{error['message']}"
    end
    klass.load_from(answer)
  end
end

require_relative 'kupindo/user'
require_relative 'kupindo/article'
