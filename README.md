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

### 套件 Gem

#### figaro

```bash
$ bundle exec figaro install
```

來 `config/application.yml` 設定環境變數

#### rspec-rails

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

#### devise

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
bundle exec rspec -f d
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
