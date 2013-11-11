require 'open-uri'
require 'json'

class AddressesController < ApplicationController
 


  def fetch_coordinates
    @address = params[:address]
    @url_safe_address = "http://maps.googleapis.com/maps/api/geocode/json?address=" + URI.encode(@address) + "&sensor=false"


    # Your code goes here.
    url = @url_safe_address
    raw_data = open(url).read
    parsed_data = JSON.parse(raw_data)
    results = parsed_data["results"]
    first = results[0]
    geometry = first["geometry"]
    location = geometry["location"]
    @latitude = location["lat"]
    @longitude = location["lng"]
    #@latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]]

    
  end


end
