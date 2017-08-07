source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.2'
gem 'mysql2', '>= 0.3.18', '< 0.5'
gem 'puma', '~> 3.0'
gem 'turbolinks', '~> 5'
gem 'therubyracer', platforms: :ruby

# fontsのdigestなしの書き出し
gem 'non-stupid-digest-assets'

# UI/UX
gem 'jquery-rails'
gem 'coffee-rails', '~> 4.2'
gem 'bootstrap-sass'
gem 'font-awesome-sass'
gem 'sass-rails', '~> 5.0'
gem 'haml-rails'
gem 'erb2haml'
gem 'jbuilder', '~> 2.5'
gem 'uglifier', '>= 1.3.0'

# gem 'redis', '~> 3.0'

# ユーザー機能
gem 'devise'
gem 'devise-i18n'
# gem 'bcrypt', '~> 3.1.7'

# 日本語化
gem 'rails-i18n'

# テキストのURLをリンクにする
gem 'rails_autolink'

# サイトマップ
gem 'sitemap_generator'

# crontab管理
gem 'whenever', require: false

# サムネイル
gem 'carrierwave'
gem 'piet'
gem 'mini_magick'
gem 'fog'

# 役割定義
# gem 'cancancan'

# 検索機能
# gem 'ransack'

# ページネーション
gem 'kaminari'

# パンくず
gem 'gretel'

# フォーム
# gem 'bootstrap_form'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'pry-rails'
  gem 'capistrano'
  gem 'capistrano-rbenv'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano3-unicorn'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'bullet'
end

group :production do
  gem 'unicorn'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
