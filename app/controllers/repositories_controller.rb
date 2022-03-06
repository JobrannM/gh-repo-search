# frozen_string_literal: true

class RepositoriesController < ApplicationController
  def search
    if query.blank?
      redirect_to(root_path)
    else
      response_object = GithubApiSearchReposService.new(query).perform
      @repositories = BuildRepositoryObjectService.new(response_object).perform
    end
  end

  private

  def search_params
    params.permit(:query, :commit)
  end

  def query
    search_params[:query]
  end
end
