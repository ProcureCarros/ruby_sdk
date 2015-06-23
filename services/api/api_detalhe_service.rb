module ServiceLayer


  class ApiDetalheService < ApiService

    @@endpoint = ServiceLayer::ApiService::DETALHE_ENDPOINT


    def getDetalheAnuncio(url)
      method = "get"
      params = {}
      return query(@@endpoint, method, :get, params)
    end


  end
end
