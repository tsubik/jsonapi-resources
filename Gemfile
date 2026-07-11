source 'https://rubygems.org'

gemspec

platforms :jruby do
  gem 'activerecord-jdbcsqlite3-adapter'
end

version = ENV['RAILS_VERSION'] || 'default'

platforms :ruby do
  if version.start_with?('4.2', '5.0')
    gem 'sqlite3', '~> 1.3.13'
  elsif version.start_with?('4', '5', '6', '7.0')
    gem 'sqlite3', '~> 1.4'
  else
    # Rails 7.1+ supports sqlite3 2.x, Rails 8 requires it.
    gem 'sqlite3', '>= 1.4'
  end
end

case version
when 'master'
  gem 'railties', { git: 'https://github.com/rails/rails.git' }
when 'default'
  gem 'railties', '>= 6.0'
else
  gem 'railties', "~> #{version}"
end
