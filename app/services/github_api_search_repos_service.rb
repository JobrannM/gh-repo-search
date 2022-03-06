# frozen_string_literal: true

class GithubApiSearchReposService
  class GithubApiError < StandardError; end

  BASE_URL = 'https://api.github.com'
  ENDPOINT = '/search/repositories'
  SORT_BY = 'stars'
  RESULTS_PER_PAGE = 100

  attr_reader :search_term

  def initialize(search_term)
    @search_term = search_term
  end

  def perform
    response = HTTParty.get(
      url,
      headers
    )

    if response.success?
      JSON.parse(response.body)
    else
      raise GithubApiError, "HTTP request failed with code #{response.code}"
    end
  end

  private

  def url
    BASE_URL +
      ENDPOINT + '?&' \
      "q=#{search_term}" + '&' \
      "sort=#{SORT_BY}" + '&' \
      "per_page=#{RESULTS_PER_PAGE}"
  end

  def headers
    {
      headers: {
        'Accept' => 'application/vnd.github.v3+json',
      },
    }
  end
end
