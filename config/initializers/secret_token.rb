# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Darnbrokenrails::Application.config.secret_key_base = 'aaaee43966126a2db8f85ea81df6a32e6a4b10892520f63a10a551f1dbf0124d21a6bd03adc0a091b102c08de3e462d7d1a178e8367efa8fd3be03940b476172'
# XXX This code violates the "Session Setting" portion of Brakeman.
# This section commits the secret_key_base to your Github.
# You may find the documentation relating to this below.
# Source: http://brakemanscanner.org/docs/warning_types/session_setting/
