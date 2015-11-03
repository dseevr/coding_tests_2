
require "json"

require "active_support"

FUNDS_FILE = "funds.json"
FUND_PRICES_FILE = "fund_prices.json"
PORTFOLIO_FILE = "portfolio.json"


def load_json_file(filename)
  if File.exist?(filename)
    JSON.parse(File.read(filename))
  else
    raise "File does not exist: #{filename}"
  end
end

def load_funds
  load_json_file(FUNDS_FILE)
end

def load_fund_prices
  load_json_file(FUND_PRICES_FILE)
end

def load_portfolio
  load_json_file(PORTFOLIO_FILE)
end

# normally you'd just use a library for formatting this, but ruby doesn't have one easily
# available.  this wouldn't handle negative values correctly, etc.
def format_money(amount)
  dollars = amount.to_i.to_s
  # chunk into groups of 3 separated by commas
  while dollars.sub!(/(\d+)(\d\d\d)/,'\1,\2'); end

  cents = ((amount - amount.to_i) * 100).to_i

  "$#{dollars}.%02d" % (cents)
end
