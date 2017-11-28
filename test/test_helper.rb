$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'keycloak_admin'

require 'minitest/autorun'

module TestConfig
  def self.url
    @url ||= ENV['KEYCLOAK_URL'] || 'http://localhost:8080'
  end

  def self.login
    @login ||= ENV['KEYCLOAK_LOGIN'] || 'admin:admin'
  end

  def self.credentials
    {
      username: username,
      password: password,
      grant_type: 'password',
      client_id: 'admin-cli'
    }
  end

  def self.password
    login.split(':')[1]
  end

  def self.username
    login.split(':')[0]
  end
end
