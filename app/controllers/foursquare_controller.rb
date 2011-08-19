class FoursquareController < ApplicationController
  def index
    
  end
  
  def feed
    require 'net/https'

    uri = URI.parse('https://foursquare.com/oauth2/access_token' + 
                      '?client_id=ESHSNEX3FLAX0EC0U3FJGNNHFAAGK0IEE1CJEIWMIQGRP25N' + 
                      '&client_secret=UUMMKTNC3LLQIHU3I2PLTAHKX1Y04R54KRCHKGIDKGKNKIB0' +
                      '&grant_type=authorization_code' +
                      '&redirect_uri=http://localhost:3000/foursquare/feed' +
                      '&code=' + params[:code])
    http = Net::HTTP::new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    
    request = Net::HTTP::Get.new(uri.request_uri)
    
    @response = http.request(request)    
  end
    
end
