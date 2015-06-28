module Procurecarros
  module ServiceLayer

    require('services/client')

    ##
    # Query Service Layer for data
    # Lista service
    #
    #
    class ApiListaService

      def initialize client_id, client_token
        @client = Procurecarros::ServiceLayer::Client.discover("v1","lista", client_id, client_token)
      end

      def search(search_params, curr_page, num_reg = 50)

        method = @client.api.lista.search
        params = {
            "search_params" => search_params,
            "page" => curr_page,
            "registros" => num_reg
        }
        return @client.query(method, params)

      end

    end
  end
end