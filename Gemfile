# A sample Gemfile
source "http://rubygems.org"

gem 'ffi', '1.0.11'    # 1.0.10 would not build on Windows

gem 'qtbindings'
gem 'htmlentities'
gem 'rubywarrior-i18n'

group :development do
  gem 'guard'
  gem 'guard-shell'
  gem 'rb-inotify', :require => false
  gem "rb-fsevent", "~> 0.9.3", :require => false
  gem 'rb-fchange', :require => false
  gem 'compass'
end

group :test do
  if RUBY_PLATFORM =~ /(win32|w32)/
    gem "win32console", '1.3.2'
  end
  # only needed for testing
  gem 'rake', '12.3.3'
  gem 'minitest', '5.3.5'  # RubyMine supports minitest higher than 3.1.0
  gem 'minitest-reporters', '1.0.4'  # RubyMine requires minitest-reporters 0.5.0 or higher
  gem 'mocha', '1.1.0', :require => false
end
