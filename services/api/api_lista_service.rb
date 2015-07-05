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

      ##
      #
      #
      # @param search_params => {
      #   :termo_pesquisa => termo_pesquisa || nil,
      #   :uf => uf || nil,
      #   :nome_cidade => nome_cidade || nil,
      #   :marca => marca || nil,
      #   :modelo => modelo || nil,
      #   :ano_min_max => ano_min_max || nil,
      #   :nome_versao => nome_versao || nil,
      #   :cor => cor || nil,
      #   :km_min_max => km_min_max || nil,
      #   :preco_min_max => preco_min_max || nil
      # }
      # @param page => 1,2,3,4
      # @param num_reg => 50,100,200
      #
      def search(search_params, page, num_reg = 50)

        method = @client.api.search
        params = {
            "search_params" => search_params,
            "page" => page,
            "registros" => num_reg
        }
        return @client.query(method, params)

      end

    end
  end
end