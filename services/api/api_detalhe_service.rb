module Procurecarros
  module ServiceLayer

    require('services/client')

    class ApiDetalheService

      # @@endpoint = ServiceLayer::ApiService::DETALHE_ENDPOINT

      def initialize client_id, client_token
        @client = Procurecarros::ServiceLayer::Client.discover("v1","lista", client_id, client_token)
      end

      def getDetalheAnuncio(url)
        method = @client.api.detalhe.get_detalhe
        params = {

        }
        return @client.query(method, params)
      end


    end
  end
end