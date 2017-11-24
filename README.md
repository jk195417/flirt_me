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

`Gemfile`

```ruby
gem 'figaro'
```

```bash
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

`Gemfile`

```ruby
gem 'simple_form'
```

```bash
$ rails generate simple_form:install --bootstrap
```

#### rspec-rails

`Gemfile`

```ruby
group :development, :test do
  gem 'rspec-rails', '~> 3.6'
  gem 'rails-controller-testing'
end
```

```bash
$ bundle
$ rails generate rspec:install
```

執行測試案例用

```bash
$ bundle exec rspec
```

#### rails-erd

電腦需要有安裝 GraphViz，Mac 上透過 brew 安裝

```bash
$ brew install graphviz
```

`Gemfile`

```ruby
gem 'rails-erd', require: false, group: :development
```

輸出 `erd.pdf` 檔案

```bash
$ bundle exec erd
```

#### devise

`Gemfile`

```ruby
gem 'devise'
gem 'devise-i18n'
```

```bash
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
