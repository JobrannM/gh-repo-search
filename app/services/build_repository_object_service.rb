# frozen_string_literal: true

class BuildRepositoryObjectService
  attr_reader :json_object

  def initialize(json_object)
    @json_object = json_object
  end

  def perform
    json_object['items'].map do |item|
      build_repository_object(item)
    end
  end

  private

  def build_repository_object(properties)
    Repository.new(
      title: properties.fetch('name'),
      owner: properties.dig('owner', 'login'),
      url: properties.fetch('html_url'),
      owner_url: properties.dig('owner', 'html_url'),
      description: properties.fetch('description'),
      stars: properties.fetch('stargazers_count'),
      language: properties.fetch('language')
    )
  end
end
