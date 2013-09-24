VCR.configure do |c|
  c.cassette_library_dir  = Rails.root.join("spec", "fixtures", "vcr_cassettes")
  c.hook_into :webmock
  c.debug_logger = File.open("log/vcr.log", 'w')
  c.configure_rspec_metadata!
  c.default_cassette_options = {  
    re_record_interval: 1.week, 
    match_requests_on: [:method,
      VCR.request_matchers.uri_without_param(:timestamp, :hashkey)]
    }
end