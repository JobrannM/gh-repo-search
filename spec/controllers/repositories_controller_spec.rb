#frozen_string_literal: true

require 'rails_helper'

RSpec.describe RepositoriesController do
  
  describe "#search" do
    let(:valid_params) do
      { "query"=>"hello-world", "commit"=>"Search" }
    end

    it 'works' do
      VCR.use_cassette('github_api_search_repos_service') do
        get :search, params: valid_params
        expect(response.status).to eq 200
      end
    end
  end
end
