module Procurecarros
  module ServiceLayer

    require('services/client')

    ##
    # Query Service Layer for data
    #
    #
    class ApiUsuarioService

      def initialize client_id, client_token
        @client = Procurecarros::ServiceLayer::Client.discover("v1","usuario", client_id, client_token)
      end

      def authenticate(usuario, password)
        #TODO: sha1 on password
        method = @client.api.login
        params = {
            "usuario" => usuario,
            "password" => password
        }
        return @client.query(method, params)
      end

      def logout(usuario)
        method = @client.api.logout
        params = {
            "usuario" => usuario
        }
        return @client.query(method, params)
      end

      ##
      #
      #
      #
      #
      #
      #
      #
      #
      def register(user_data)
        method = @client.api.register
        params = {
            "usuario" => user_data
        }
        return @client.query(method, params)
      end

    end
  end

end
