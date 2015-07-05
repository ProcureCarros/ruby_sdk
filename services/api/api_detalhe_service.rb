module Procurecarros
  module ServiceLayer

    require('services/client')

    class ApiDetalheService

      # @@endpoint = ServiceLayer::ApiService::DETALHE_ENDPOINT

      def initialize client_id, client_token
        @client = Procurecarros::ServiceLayer::Client.discover("v1","detalhe", client_id, client_token)
      end

      def getDetalheAnuncio(codigoAnuncio)
        method = @client.api.get_detalhe
        params = {
          :codigoAnuncio => codigoAnuncio
        }
        return @client.query(method, params)
      end


      def sendLead(codigoAnuncio, form)
        method = @client.api.send_lead
        params = {
          :codigo_anuncio => codigoAnuncio,
          :nome => form[:nome],
          :email => form[:email],
          :telefone => form[:telefone],
          :msg => form[:msg],
          :ofertas_similares => form[:ofertas_similares],
          :newsletter => form[:newsletter]
        }
        return @client.query(method, params)
      end

      def getSimulacaoFinanciamento(valor_automovel, entrada, parcelas, txJuros)
        method = @client.api.simulacao_financiamento
        params = {
            :valor_automovel => valor_automovel,
            :entrada => entrada,
            :parcelas => parcelas,
            :txJuros => txJuros
        }
        return @client.query(method, params)
      end

      def getValorIPVA(estadoSigla, valor_veiculo)
        method = @client.api.valor_ipva
        params = {
            :estado => estadoSigla,
            :valor_veiculo => valor_veiculo
        }
        return @client.query(method, params)
      end

    end
  end
end