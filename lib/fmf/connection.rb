require 'faraday_middleware'

module FMF
  module Connection  	  	
  	private

  	#TODO: proxy and url should be options
  	def connection(options={})
     Faraday.new(:url => 'http://www.femexfut.org.mx/portalv2/webservices/ws_portal_v2.aspx/', 
     :proxy=>"") do |builder|
       builder.use Faraday::Response::Mashify
       builder.use Faraday::Response::ParseXml
       builder.use Faraday::Response::Logger  
       builder.adapter Faraday.default_adapter
     end
    end
  end
end