require 'date'
require_relative 'base'

class Kupindo
  class User
    include Base
    string_attrs :user_name, :terms_of_sale, :city, :public_wishlist_url
    int_attrs :user_id, :total_feedback_score, :positive_feedback_score, :negative_feedback_score
    time_attrs :registration_date, :last_activity

  end
end
