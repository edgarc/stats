module FMF
  class Client
    module Team
      
      #Returns general team information
      #@overload team(team, options={})
      #   @param team_id [Integer, String] Valid fmf team id 
      #   @return [Hashie::Mash] Team info
      #   @example Return information for team 9
      #     FMF.team 9
      #     FMF.team "9"
      def team(*args)
        team_id = args.first 
        response = get('?Txml=4&ID='+team_id.to_s()+'&Tpo=1', {}).Elementos.Elemento
      end
      
      #Returns players for a given team
      #   @param team_id [Integer, String] Valid fmf team id 
      #   @param player_type [Integer, String] Valid player type
      #     1 - goalkeppers
      #     2 - defense
      #     3 - midfielders
      #     4 - forwards
      #   @example Return goalkeepers for team 9
      #     FMF.players 9, 1
      def players(*args)        
        team_id = args.first 
        player_type = args.last
        response = get('?Txml=5&ID='+team_id.to_s()+'&Tpo='+player_type.to_s(), {}).Elementos.Elemento
      end
      
      #Returns managers for a given team
      #   @param team_id [Integer, String] Valid fmf team id 
      #   @example Return managers for team 9
      #     FMF.managers 9
      def managers(*args)
        team_id = args.first 
        response = get('?Txml=28&ID='+team_id.to_s(), {}).Elementos.Elemento
      end
      
      #Returns seasons for a given team
      #   @param team_id [Integer, String] Valid fmf team id 
      #   @param t_type [Integer, String] 1 local 2 internationals
      #   @example Return local seasons for team 9
      #     FMF.seasons 9, 1
      def seasons(*args)
        #?Txml=24&Intr='+t_type.to_s()+'&ID='+team_id.to_s()
        team_id = args.first 
        t_type = args.last
        response = get('?Txml=24&Intr='+t_type.to_s()+'&ID='+team_id.to_s(), {}).Elementos.Elemento
      end  
      
      #Returns fixtures for a given season
      #   @param season_id [String] Valid season id 
      #   @example Return fixtures for a given season for team 9
      #     FMF.fixtures "62|22|9|6"
      def fixtures(*args)
        season_id = args.first
        response = get('?Txml=25&ID='+season_id.to_s()+'&Tipo=JJ', {}).Elementos.Elemento
      end  
    end
  end
end