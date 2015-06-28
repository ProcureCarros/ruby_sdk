require 'spec_helper'
require 'client'



describe Procurecarros::ServiceLayer::Client do

  before do

  end

  context "when getting an API" do
    context "and having valid credentials" do
      it "should pass" do
        # Procurecarros::ServiceLayer::Client.discover "v1", "dummy", PROCURECARROS_API_CLIENT, PROCURECARROS_API_TOKEN
        expect { Procurecarros::ServiceLayer::Client.discover("v1", "dummy", PROCURECARROS_API_CLIENT, PROCURECARROS_API_TOKEN) }.not_to raise_error()
      end
    end

    context "and not having valid credentials" do
      it "should raise an error" do
        expect { Procurecarros::ServiceLayer::Client.discover "v1", "dummy" }.to raise_error(RestClient::Unauthorized)
      end
    end


  end

end


@client = Procurecarros::ServiceLayer::Client.discover("v1","capa", client_id, client_token)