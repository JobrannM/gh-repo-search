# frozen_string_literal: true

class Repository
  attr_reader :title, :owner, :url, :owner_url, :description, :stars, :language

  def initialize(title:, owner:, url:, owner_url:, description:, stars:, language:)
    @title = title
    @owner = owner
    @url = url
    @owner_url = owner_url
    @description = description
    @stars = stars
    @language = language
  end
end
