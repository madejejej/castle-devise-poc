# Castle Devise integration POC

This repository contains a small Rails app which integrates Castle and Devise. 

All the integration code leaves under `lib/castle_devise` so it's easy to extract to a gem later on.

Instructions below are meant to be extracted to the gem's README.

___

# CastleDevice

CastleDevise is a [Devise](https://github.com/heartcombo/devise) plugin that integrates [Castle](https://castle.io). 

It currently provides the following features:
- preventing bots from registration attacks using Castle's [filter API](https://docs.castle.io/v1/reference/api-reference/#filter)
- preventing ATO attacks using Castle's [Risk API](https://docs.castle.io/v1/reference/api-reference/#risk)

If you want to learn about all capabilities of Castle, please take a look at [our documentation](https://docs.castle.io/).

## Installation

Include `castle_devise` in your Gemfile:

```ruby
gem 'castle_devise'
```

Create `config/initializers/castle_devise.rb` and fill in your API secret and APP_ID from the [Castle Dashboard](https://dashboard.castle.io/settings/general)

```ruby 
CastleDevise.configure do |config|
  config.api_secret = ENV.fetch('CASTLE_API_SECRET')
  config.app_id = ENV.fetch('CASTLE_APP_ID')
end
```

Add `:castle_protectable` Devise module to your User model:

```ruby 
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :castle_protectable # <--- add this
end
```

#### Further steps if you're not using Webpacker

Include Castle's c.js script in the head section of your layout:

```ruby
<%= castle_javascript_tag %>
```

Add the following tag to the the `<form>` tag in both `devise/registrations/new.html.erb` and `devise/sessions/new.html.erb` (if you haven't generated them yet, run `rails generate devise:views`):

```ruby
<%= form_for @user do |f| %>
  …
  <%= castle_request_token %>
  …
<% end %>
```

You're set! Now verify that everything works by logging in to your application as any user. You should be able to see that User on the [Castle Users Page](https://dashboard.castle.io/users)


#### Further steps if you're using Webpacker

Add `castle.js` to your package.json file.

TODO: fill this in.
