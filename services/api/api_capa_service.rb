module Procurecarros
  module ServiceLayer

    ##
    # Query Service Layer for data
    #
    #
    class ApiCapaService

      def initialize client_id, client_token
        @client = Procurecarros::ServiceLayer::Client.discover("v1","capa", client_id, client_token)
      end

      def getSuperDestaque()

        method = @client.api.capa.destaque.super #"destaque/super"
        params = {
            "page" => 1,
            "registros" => 3
        }
        return @client.query(method, params)
      end

      def getDestaques()
        method = @client.api.destaque.normal
        params = {
            "page" => 1,
            "registros" => 3
        }
        return @client.query(method, params)
      end

      def getOutrasOfertas()
        method = @client.api.capa.destaque.outras
        params = {
            "page" => 1,
            "registros" => 8
        }
        return @client.query(method, params)
      end

      def getMaisCompartilhados()
        method = @client.api.capa.destaque.mais_compartilhadas
        params = {
            "page" => 1,
            "registros" => 4
        }
        return @client.query(method, params)
      end

      def getMaisBuscados()
        method = @client.api.capa.destaque.mais_buscados
        params = {
            "page" => 1,
            "registros" => 36
        }
        return @client.query(method, params)
      end


    end
  end

end
