require 'connection'
require 'request'

module FMF
  class Client
    include Connection
    include Request

    require 'client/team'
    include FMF::Client::Team        
    
  end
end