require 'elasticsearch/model'
Elasticsearch::Model.client = Elasticsearch::Client.new(url: ENV['FOUNDELASTICSEARCH_URL'])
