class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->
  # new Hand [@pop().flip(), @pop()], @, true

  playerScore = []

  hit: ->
    @add(@deck.pop())
    @last()
    playerScore.push @scores()[0]
    if @scores()[0] > 21 
      @trigger('busted',this)
      @trigger('reset', this)

    
  stand: ->
    console.log(playerScore)
    @at(0).flip()
    while ([@minScore(), @minScore() + 10 * @hasAce()][0] < 17)
      @add(@deck.pop())
      @last()
    if @scores()[0] > 21 
      @trigger('busted', this)
      @trigger('reset', this)
    else if @scores()[0] > playerScore[playerScore.length - 1]
      alert("Dealer Wins")
      @trigger('reset', this)
    else
      alert("Player wins")
      @trigger('reset', this)
    
    

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]



