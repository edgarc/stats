module FMF
  class Client
    module Team
      def team(*args)
        team_id = args.first 
        response = get('Txml=4&ID=#{team_id}&Tpo=1')
      end
    end
  end
end