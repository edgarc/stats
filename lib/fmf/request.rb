module FMF
	module Request
		
		def get(path, params={}, options={})
	     request(:get, path, params, options)
	    end

	    private

	    def request(method, path, params, options)
	      response = connection(options).send(method) do |request|
		      case method.to_sym
		      	when :get, :delete
		      		request.url(path)
		       		#request.url(formatted_path(path, options), params)
		      #when :post, :put
		      # request.path = formatted_path(path, options)
		      # request.body = params unless params.empty?
		      end
	      end
	      options[:raw] ? response : response.body
	    end

	    #def formatted_path(path, options={})
	    #  [path, options.fetch(:format, format)].compact.join('.')
	    #end
	end
end	 