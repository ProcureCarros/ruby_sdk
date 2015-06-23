module ServiceLayer
  class ApiService

    public

    CAPA_ENDPOINT    = "anuncios/capa/"
    LISTA_ENDPOINT   = "anuncios/lista/"
    DETALHE_ENDPOINT = "anuncios/detalhe/"

    ADMIN_USER_ENDPOINT = "user/"
    ADMIN_ANUNCIO_CRUD_ENDPOINT = "anuncio/admin/"
    ADMIN_CREDITO_ENDPOINT = "financeiro/credito/"

    #

    protected

    def query(endpoint, method, http_method, params)
      request = constructRequest(endpoint+method, http_method, params)
      signed_request = sign(request, API_ACCESS_ID, API_ACCESS_SECRET)
      JSON.load signed_request.execute()
    end

    private

    def constructRequest(endpoint, method, params)
      headers = { #'Content-MD5' => "",
                  'Content-Type' => "application/json"
                  # ,'Date' => Time.now
      }
      RestClient::Request.new(:url => API_SERVER_URL+"endpoint/"+endpoint,
                                         :headers => headers,
                                         :method => method,
                                         :params => params)
    end

    def sign(request, access_id, secret_key)
      # @signed_request = ApiAuth.sign!(request, access_id, secret_key)
      ApiAuth.sign!(request, access_id, secret_key)
    end

  end
end