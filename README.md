# README

Flirt Me 撩我 聊天機器人

## 技術棧：

- ruby 2.4.1
- rails 5.1.4
- postgres 9.6.5
- line messaging api v2
- bootstrap 4 beta 2

## 設定：

### 系統

需要安裝以下相依的軟體

- ruby 2.4.1
- rails 5.1.4
- postgres 9.6.5
- yarn

### 資料庫

至 `config/database.yml` 設定

- username

### 語言與時區

`config/application.rb` 加入

```ruby
config.encoding = 'utf-8'
config.time_zone = 'Taipei'
config.i18n.default_locale = 'zh-TW'
```

### yarn

確定 `config/initializers/assets.rb` 有這行設定，引入 node_modules 當作 assets

```ruby
# config/initializers/assets.rb
Rails.application.config.assets.paths << Rails.root.join('node_modules')
```

確認 `bin/setup` 中要有這行設定

```ruby
system('bin/yarn')
```

把 `yarn.lock` 和 `package.json` git commit 進去

再把 `/node_modules` 和 `/yarn-error.log` 加入 .gitignore 內

```
/node_modules
/yarn-error.log
```

我們不想把繁重的 `node_modules` 也一併上傳到雲端去，未來只需要連進雲端主機下指令

```bash
$ yarn
# or
$ yarn install
```

就能把 `node_modules` 裝起來了

`yarn` 常用的幾個指令如下

```bash
# 新增函式庫
$ yarn add some_package
# 移除函式庫
$ yarn remove some_package
# 安裝函式庫
$ yarn
```

### 套件

#### figaro

`Gemfile` 加入

```ruby
gem 'figaro'
```

```bash
$ bundle install
$ bundle exec figaro install
```

來 `config/application.yml` 設定環境變數

#### bootstrap 4

```bash
$ yarn add bootstrap@4.0.0-beta.2
$ yarn add jquery@1.9.1
$ yarn add popper.js@^1.12.3
```

`assets/javascripts/application.js` 加上

```javascript
//= require jquery/jquery
//= require popper.js/dist/umd/popper
//= require bootstrap/dist/js/bootstrap
```

`assets/javascripts/application.css` 改名為 `assets/javascripts/application.scss`

`assets/javascripts/application.scss` 加上

```scss
@import 'bootstrap/scss/bootstrap';
```

#### simple_form

`Gemfile` 加入

```ruby
gem 'simple_form'
```

```bash
$ bundle install
$ rails generate simple_form:install --bootstrap
```

#### devise

`Gemfile` 加入

```ruby
gem 'devise'
gem 'devise-i18n'
```

```bash
$ bundle install
$ rails generate devise:install
```

`config/environments/development.rb`

```ruby
config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
```

```bash
$ rails generate devise User
$ rails db:migrate
```

產生 `app/views/devise/`

```bash
$ rails generate devise:i18n:views
```

對應的中文翻譯

```bash
$ rails generate devise:i18n:views
$ rails generate devise:i18n:locale zh-TW
```

#### rolify

`Gemfile` 加入

```ruby
gem 'rolify'
```

```bash
$ bundle install
$ rails g rolify Role User
```

migration檔案補上版本號 5.1

```ruby
# 原本
class RolifyCreateRoles < ActiveRecord::Migration
# 改成
class RolifyCreateRoles < ActiveRecord::Migration[5.1]
```

```bash
$ rake db:migrate
```

#### cancancan

`Gemfile` 加入

```ruby
gem 'cancancan', '~> 2.0'
```

安裝

```bash
$ bundle install
$ rails g cancan:ability
```

用 `devise`+`rolify`+`cancancan` 做會員分權

權限定義於 `app/models/ability.rb`

#### kaminari

分頁

`Gemfile` 加入 `kaminari`

```ruby
# Gemfile
gem 'kaminari'
```

使用 bootstrap4 theme

```bash
$ rails g kaminari:views bootstrap4
```

用法參考 <https://github.com/kaminari/kaminari>

#### rails-erd

電腦需要有安裝 GraphViz，Mac 上透過 brew 安裝

```bash
$ brew install graphviz
```

`Gemfile` 加入

```ruby
gem 'rails-erd', require: false, group: :development
```

安裝

```bash
$ bundle install
```

輸出 `erd.pdf` 檔案

```bash
$ bundle exec erd
```

### 測試套件

- rspec-rails
- rails-controller-testing
- factory_bot_rails
- database_cleaner

`Gemfile` 加入

```ruby
group :development, :test do
  gem 'rspec-rails', '~> 3.6'
  gem 'factory_bot_rails', '~> 4.0'
  gem 'rails-controller-testing'
end

group :test do
  gem 'database_cleaner'
end
```

安裝

```bash
$ bundle install
```

設定 rspec

```bash
$ rails generate rspec:install
```

設定 factory_bot_rails，新增 `spec/support/factory_bot.rb`

```ruby
RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end
```

注意 `spec/rails_helper.rb` 需要 require `spec/support/` 資料夾下的檔案。`spec/support/` 內別放 `_spec.rb` 結尾的測試檔，只放設定檔。不然會被 require 兩次。

```ruby
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
```

設定 database_cleaner，刪除 `spec/rails_helper.rb` 中下列設定

```ruby
# Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
config.fixture_path = "#{::Rails.root}/spec/fixtures"

# If you're not using ActiveRecord, or you'd prefer not to run each of your
# examples within a transaction, remove the following line or assign false
# instead of true.
config.use_transactional_fixtures = true
```

新增 `spec/support/database_cleaner.rb` 加入下面的設定

```ruby
RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
```

加入會員功能的測試

在 `spec/rails_helper.rb` 的 `require 'rspec/rails'` 後加入下面這行

```ruby
require 'devise'
```

新增 `spec/support/devise.rb` 加入下面設定

```ruby
RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, :type => :controller
end
```

執行測試案例用

```bash
$ bundle exec rspec
```

參考

<https://github.com/plataformatec/devise/wiki/How-To:-Test-controllers-with-Rails-3-and-4-%28and-RSpec%29>

<https://github.com/DatabaseCleaner/database_cleaner#rspec-example>

<https://github.com/thoughtbot/factory_bot/blob/master/GETTING_STARTED.md>

<https://github.com/eliotsykes/rspec-rails-examples/blob/master/spec/support/database_cleaner.rb>

### 環境變數

至 `config/application.yml` 設定

- production secret key base

```bash
$ rails secret
```

執行指令後的結果貼至

```yml
production:
  secret_key_base: 'here'
```

- host

`config/environments/production.rb` 設定應用程式網域，例如 flirt-me.herokuapp.com

```ruby
# config/environments/production.rb
config.action_mailer.default_url_options = { host: 'flirt-me.herokuapp.com' }
```

- Line

填入 Line bot 的

- line_channel_id
- line_channel_secret
- line_channel_token

資訊可以從 <https://developers.line.me/console/channel/{channel-id}/basic/> 得知

```yml
line_channel_id: ''
line_channel_secret: ''
line_channel_token: ''
```

## 建立資料庫

```bash
$ rails db:migrate
$ rails db:setup
```

## 測試

跑所有測試

```bash
$ bundle exec rspec
# 加上 -f d 參數顯示 desc
$ bundle exec rspec -f d
```

只測 model

```bash
$ bundle exec rspec/models
```

只測 some_controller_spec.rb

```bash
$ bundle exec rspec/controllers/some_controller_spec.rb
```

只測 some_controller_spec.rb 的第 8 行

```bash
$ bundle exec rspec/controllers/some_controller_spec.rb:8
```

## rake 任務

待補充

## 部署

確認要上傳的程式碼都已經 push 到本地 git 的 master 分支後，執行

```bash
$ git push heroku master
# config/application.yml 有新的環境變數要設定時執行
$ figaro heroku:set -e production
# 資料庫有新的 migration 時執行
$ heroku run rails db:migrate
```

### 第一次部署要做的設定

由於我們要部署的專案是 `Rails 5.1` 版，有使用到 `yarn`，所以 Buildpacks 除了 `heroku/ruby` 之外 還需要 `heroku/nodejs`，且要放在 `heroku/ruby`之前，可以透過下面指令來做設定

```bash
# 注意順序
$ heroku buildpacks:add heroku/nodejs
$ heroku buildpacks:add heroku/ruby
```

Heroku 會偵測到 Rails 框架，自動幫我們把 Heroku Postgres 架起來，並且跟 Rails app 連結

> 參考 <https://devcenter.heroku.com/articles/ruby-support#installed-binaries>

### 常用指令

```bash
# 追蹤 log
$ heroku logs --tail
# heroku config
$ heroku config
# 備份 db 到本地的 local_db_name
$ heroku pg:pull DATABASE_URL local_db_name --app flirt-me
```
