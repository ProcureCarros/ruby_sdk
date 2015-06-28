#!/bin/ruby

carro_modelo=$param[1]

@client = Procurecarros::ServiceLayer::Client.discover("v1","capa", 1234, "abc")

method = @client.api.anuncio.cadastro
params = {
    :carro => {
      :modelo => {

      }
    }
}
@client.query(method, params)