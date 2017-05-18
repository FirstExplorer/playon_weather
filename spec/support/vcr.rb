VCR.configure do |config|
  config.cassette_library_dir = Rails.root.join("spec", "vcr")
  config.hook_into :webmock
  config.ignore_hosts "codeclimate.com"
  config.allow_http_connections_when_no_cassette = true
end
