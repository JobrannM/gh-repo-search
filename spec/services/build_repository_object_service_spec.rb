require 'rails_helper'

RSpec.describe BuildRepositoryObjectService do
  let(:example_object) do
    {
      "total_count"=>1,
      "incomplete_results"=>false,
      "items"=>[{
        "id"=>136631345,
        "node_id"=>"MDEwOlJlcG9zaXRvcnkxMzY2MzEzNDU=",
        "name"=>"hello-world",
        "full_name"=>"JobrannM/hello-world",
        "private"=>false,
        "owner"=>{
          "login"=>"JobrannM",
          "id"=>32314050,
          "node_id"=>"MDQ6VXNlcjMyMzE0MDUw",
          "html_url"=>"https://github.com/users/JobrannM",
        }, 
          "html_url"=>"https://github.com/JobrannM/hello-world",
          "description"=>"A simple hello world project",
          "created_at"=>"2018-06-08T14:45:13Z",
          "updated_at"=>"2022-03-06T10:23:34Z",
          "stargazers_count"=>1,
          "watchers_count"=>1,
          "language"=>"Ruby",
          "forks"=>0,
          "open_issues"=>0,
          "watchers"=>1,
          "default_branch"=>"master",
          "score"=>1.0
        }
      ]
    }
  end

  subject { described_class.new(example_object) }

  describe "#perform" do
    it "builds a Repository Object" do
      repository = subject.perform.first
      expect(repository).to be_an_instance_of Repository
      expect(repository.title).to eq "hello-world"
      expect(repository.owner).to eq "JobrannM"
      expect(repository.url).to eq "https://github.com/JobrannM/hello-world"
      expect(repository.owner_url).to eq "https://github.com/users/JobrannM"
      expect(repository.description).to eq "A simple hello world project"
      expect(repository.stars). to eq 1
      expect(repository.language).to eq "Ruby"
    end
  end
end
