# Kupindo Ruby client

Here's a proof of concept for developing Kupindo Ruby client (wrapper around REST API).

It currently provides just couple of basic methods, but could be a starting point for comprehensive one, if one desires to build around it.

It doesn't include OAuth2 code so you have to manage authentication and your tokens yourself. Perhaps it will be incorporated in the future.

## Example

    require 'kupindo'
    
    client = Kupindo.new :access_token => '<your token here>'
    
    u = client.get_user 'jablanyu'
    # => #<Kupindo::User:0x000000024a06d0...
    u.city
    # => "Palilula"
    
    a = client.get_article 18815501
    # => #<Kupindo::Article:0x000000025878c8...
    a.article_name
    # => "Kućište za Raspberry Pi" 
