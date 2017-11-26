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
group :test do
  gem 'rspec-rails', '~> 3.6'
  gem 'factory_bot_rails', '~> 4.0'
  gem 'rails-controller-testing'
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

注意 `spec/rails_helper.rb` 需要 require `spec/support/` 資料夾下的檔案。

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

執行測試案例用

```bash
$ bundle exec rspec
```

<https://github.com/thoughtbot/factory_bot/blob/master/GETTING_STARTED.md>

### 環境變數

至 `config/application.yml` 設定

- production secret key base

```bash
$ rails secret
`
```

執行指令後的結果貼至

```yml
production:
  secret_key_base: 'here'
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
