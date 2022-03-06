# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(GithubApiSearchReposService) do
  let(:search_term) { 'hello-world' }

  subject { described_class.new(search_term) }

  describe '#perform' do
    context 'successful call' do
      it 'succeeds' do
        VCR.use_cassette('github_api_search_repos_service') do
          expect { subject.perform }.to_not(raise_error)
        end
      end
    end

    context 'failed call' do
      before do
        stub_request(:get, subject.send(:url))
          .to_return(status: [500, 'stubbed error'])
      end

      it 'returns a custom error' do
        VCR.use_cassette('github_api_search_repos_service') do
          expect { subject.perform }.to(raise_error(GithubApiSearchReposService::GithubApiError))
        end
      end
    end
  end
end
