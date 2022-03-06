class RepositoriesController < ApplicationController

  def search
    unless query.blank?
      response_object = GithubApiSearchReposService.new(query).perform
      @repositories = BuildRepositoryObjectService.new(response_object).perform
    else
      redirect_to root_path
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
