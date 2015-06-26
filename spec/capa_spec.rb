require 'spec_helper'
require 'client'
require 'api/api_capa_service'


describe Procurecarros::ServiceLayer::ApiCapaService do

  before do

  end

  context "when using the API to get capa assets" do
    context "and want to get the destaques" do
      it "should pass" do
        # Procurecarros::ServiceLayer::Client.discover "v1", "dummy", PROCURECARROS_API_CLIENT, PROCURECARROS_API_TOKEN
        @apiCapaService = Procurecarros::ServiceLayer::ApiCapaService.new(PROCURECARROS_API_CLIENT, PROCURECARROS_API_TOKEN)
        expect { @apiCapaService.getDestaques }.not_to raise_error()
      end
    end



  end

end
