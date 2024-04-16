require 'elasticsearch/model'
Elasticsearch::Model.client = Elasticsearch::Client.new(host: ENV['SEARCHBOX_URL'], http: { port: 443, scheme: 'https' })
