$LOAD_PATH.unshift(File.dirname(__FILE__) + '/fmf')

require 'client'

module FMF
  
  class << self
    
    def new(options={})
      FMF::Client.new(options)
    end
    
    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end

    def respond_to?(method, include_private = false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end    
  end  
end