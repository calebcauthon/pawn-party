# Generated by cucumber-sinatra. (Fri Jan 28 10:00:35 -0600 2011)

ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '..', 'app.rb')

require 'capybara'
require 'capybara/cucumber'
require 'rspec'

Capybara.app = ChessBoard

class ChessBoardWorld
  include Capybara
  include RSpec::Expectations
  include RSpec::Matchers
end

World do
  ChessBoardWorld.new
end
