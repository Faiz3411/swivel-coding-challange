require 'elasticsearch/model'
Searchkick.client = Elasticsearch::Client.new(url: ENV['BONSAI_URL'])
