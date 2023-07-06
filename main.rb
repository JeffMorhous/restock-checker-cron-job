require 'twilio-ruby'
require 'httparty'

class RestockChecker
  include HTTParty

  ACCOUNT_SID = ENV['TWILIO_ACCOUNT_SID']
  AUTH_TOKEN = ENV['TWILIO_AUTH_TOKEN']
  SMS_CLIENT = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)

  def initialize(url_to_check, out_of_stock_text)
    @url_to_check = url_to_check
    @out_of_stock_check = out_of_stock_text
  end

  def check_stock
    puts "Checking if item is in stock"

    response = HTTParty.get(@url_to_check)
    unless response.body.include?(@out_of_stock_check)
      send_in_stock_notification
    end
    puts "Checked if item was in stock"
  end

  def send_in_stock_notification
    message = SMS_CLIENT.messages.create(
      from: ENV['FROM_NUMBER'],
      to: ENV['TO_NUMBER'],
      body: "NINJA CREAMI IS IN STOCK: #{@url_to_check}"
    )

    puts "Item in stock. Message sent, SID: #{message.sid}"
  end
end

out_of_stock_text = 'Out of Stock'
url = 'https://www.ninjakitchen.com/products/ninja-creami-breeze-7-in-1-ice-cream-maker-zidNC201'
restock_checker = RestockChecker.new(url, out_of_stock_text)
restock_checker.check_stock
