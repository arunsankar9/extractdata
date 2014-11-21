class HomeController < ApplicationController
  def extract_data
  request = Faraday.new(:url => 'http://127.0.0.1:3000') do |faraday|
  faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
  end
  
  ## GET ##

response = request.get '/api/terminals.json'     
  output= JSON.parse(response.body)
	  (0...output.length).each do | i |
		  terminal = Terminal.new
		  terminal.name=output[i]["name"] unless output[i].nil?
		  terminal.description=output[i]["description"] unless output[i].nil?
		  terminal.values=output[i]["attr_hash"] unless output[i].nil?
		  terminal.save
	  end 
	  redirect_to :controller=>:terminals  
	  end
end
