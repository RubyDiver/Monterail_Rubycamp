Sentry.init do |config|
  config.dsn = 'https://71b50f0798214970b5368fb358b6c4ba@o722712.ingest.sentry.io/5781748'
  config.breadcrumbs_logger = [:active_support_logger]

  config.traces_sample_rate = 0.5

  config.traces_sampler = lambda do |context|
    true
  end
end
