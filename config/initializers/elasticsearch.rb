require 'elasticsearch/model'
Elasticsearch::Model.client = Elasticsearch::Client.new(url: 'http://localhost:9200')
