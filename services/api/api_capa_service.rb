module ServiceLayer

  ##
  # Query Service Layer for data
  #
  #
  class ApiCapaService < ApiService

    @@endpoint = ServiceLayer::ApiService::CAPA_ENDPOINT

    def getSuperDestaque()

      method = "destaque/super"
      params = {
          "page" => 1,
          "registros" => 3
      }
      return query(@@endpoint, method, :get, params)
    end

    def getDestaques()
      method = "destaque/capa"
      params = {
          "page" => 1,
          "registros" => 3
      }
      return query(@@endpoint, method, :get, params)
    end

    def getOutrasOfertas()
      method = "destaque/outras"
      params = {
          "page" => 1,
          "registros" => 8
      }
      return query(@@endpoint, method, :get, params)
    end

    def getMaisCompartilhados()
      method = "destaque/compartilhados"
      params = {
          "page" => 1,
          "registros" => 4
      }
      return query(@@endpoint, method, :get, params)
    end

    def getMaisBuscados()
      method = "busca/mais"
      params = {
          "page" => 1,
          "registros" => 36
      }
      return query(@@endpoint, method, :get, params)
    end


  end
end