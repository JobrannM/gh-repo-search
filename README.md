# Github Repo Search Tool

## Table of Content
* [Description](#description)
* [Getting Started](#getting-started)
* [Getting Set Up](#getting-set-up)
* [Endpoint](#endpoint)
* [Questions? Need Help? Found a bug?](#questions)

## <a name="description"></a>Description
This small Ruby on Rails application displays public repositories from GitHub based on a search term provided.

## <a name="getting-started"></a>Getting Started
You're going to need:

* **Ruby, version 2.7.1 or newer**
* **Bundler** - If Ruby is already installed but the `bundle` command doesn't work, just run `gem install bundler` in a terminal.


## <a name="getting-set-up"></a>Getting Set Up
1. Fork this repository on GitHub.
2. Clone *your forked repository* to your hard drive with
`git clone https://github.com/YOURUSERNAME/gh-repo-search.git`
3. `cd gh-repo-search`
4. Initialize and start the Github Search Repo Tool locally with:

`bundle install`
`rails s`

You can now access the search function at <http://localhost:3000/>. You can either enter a term in the search bar, or directly add a `query` parameter to the `/search` endpoint.

## <a name="endpoint"></a>Endpoint

`GET search`

### Description

Returns a list of up to 100 repositories ordered by the number of stars they have on Github.

### Parameters

* **query** : the keyword(s) to search repositories on Github for

## <a name="questions"></a>Questions? Need Help? Found a bug?

If you have any questions, need help, or just want to chat with the developer, please e-mail the creator:

*  <mous.jobrann@gmail.com>

If you've found a bug or have suggestions for better, more beautiful code, go ahead and [submit an issue](https://github.com/JobrannM/MapboxMuseumFinderApi/issues). Please feel free to submit pull requests with bug fixes or changes to a separate branch.

