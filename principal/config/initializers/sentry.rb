# frozen_string_literal: true

Raven.configure do |config|
  config.dsn = 'https://3da935f264934d7d81bfaf0e04791962:43dfc70939fa4fdf8ea245594c4eac4c@sentry.io/272669'
  config.environments = %w[production]
  config.proxy = 'http://172.26.2.31:80'
end
