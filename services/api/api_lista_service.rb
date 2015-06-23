module ServiceLayer

  ##
  # Query Service Layer for data
  # Lista service
  #
  #
  class ApiListaService < ApiService

    @@endpoint = ServiceLayer::ApiService::LISTA_ENDPOINT

    def search(search_params, curr_page, num_reg = 50)

      method = "search"
      params = {
          "page" => curr_page,
          "registros" => num_reg
      }
      return query(@@endpoint, method, :post, params)

    end


    # def getSuperDestaque()
    #
    #   method = "destaque/super"
    #   params = {
    #       "page" => 1,
    #       "registros" => 3
    #   }
    #   return query(@@endpoint, method, :get, params)
    # end

  end
end
