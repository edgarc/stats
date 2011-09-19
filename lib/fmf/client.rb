require 'faraday_middleware'
require 'fmf/client/team'

module FMF
  class Client

    include FMF::Client::Team
    
    def connection(options={})
     Faraday.new(:url => 'http://www.femexfut.org.mx/portalv2/webservices/') do |builder|
       builder.use Faraday::Response::ParseXml
       builder.adapter Faraday.default_adapter
     end
    end

    def get(path, params={}, options={})
     request(:get, path, params, options)
    end

    def request(method, path, params, options)
      response = connection(options).send(method) do |request|
      case method.to_sym
      when :get, :delete
       request.url(formatted_path(path, options), params)
      when :post, :put
       request.path = formatted_path(path, options)
       request.body = params unless params.empty?
      end
      end
      options[:raw] ? response : response.body
    end

    def formatted_path(path, options={})
      [path, options.fetch(:format, format)].compact.join('.')
    end
  end
end