module Procurecarros
  module ServiceLayer

    require 'json'
    require 'hashie'
    require 'api-auth'

    class Client

      public

      @@client_config = {
          :server_uri => ENV['PROCURECARROS_API_SERVER'] || "http://api.procurecarros.com/",
          :autorizarion => true
      }

      def initialize(api_cfg = {})
        @api_config = api_cfg
        @credentials = Hash.new
        @credentials[:client] = ""
        @credentials[:token] = ""
      end

      def credentials(client, token)

        @credentials[:client] = client
        @credentials[:token] = token
      end

      def api
        return @api_config
      end

      def self.discover(api_version, api_name, client_id = nil, client_token = nil)
        discoveryInstance = self.new
        if !client_id.nil? && !client_token.nil?
          discoveryInstance.credentials(client_id, client_token)
        end
        retorno_discovery = discoveryInstance._query("discover", api_version+"/"+api_name, :get, {});
        if retorno_discovery.nil?
          raise Error ">>api_manager: Cannot get API"
        elsif retorno_discovery["errors"].nil?
          raise Error ">>api_manager: Error when getting the api: " + retorno_discovery["errors"].to_json
        end
        api_config = Hashie::Mash.new retorno_discovery["obj"]
        instance = self.new api_config
        if !client_id.nil? && !client_token.nil?
          instance.credentials(client_id, client_token)
        end
        return instance
      end

      def query api_method, params
        _query(@api_config.endpoint, api_method.rmethod, api_method.http_method, params);
      end

      def _query(endpoint, method, http_method, params)
        request = constructRequest(endpoint+"/"+method, http_method, params)
        if @@client_config[:autorizarion] == true
          request = sign(request, @credentials[:client], @credentials[:token])
        end
        JSON.load request.execute()
      end

      protected



      private

      def constructRequest(endpoint, method, params)
        headers = { 'Content-Type' => "application/json" }
        if method.to_s == 'get'
          urlParams = '?'+params.map{ |k,v|  "#{k}=#{v}"}.join('&')
        else
          urlParams = ""
        end
        RestClient::Request.new(:url => @@client_config[:server_uri]+"endpoint/"+endpoint+urlParams,
                                           :headers => headers,
                                           :method => method,
                                           :params => params)
      end

      def sign(request, access_id, secret_key)
        ApiAuth.sign!(request, access_id, secret_key)
      end

    end
  end
end
