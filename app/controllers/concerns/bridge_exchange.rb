class BridgeExchange
  include HTTParty
  base_uri 'https://whatapalaver.github.io/data/bridge/v2'

  def initialize
    @games = games
  end

  def games
    self.class.get('/bridge-hands-skewed.json').parsed_response
  end

  def game(id)
    @games[id.to_i - 1]
  end

end
