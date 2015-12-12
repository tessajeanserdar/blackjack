class window.AppView extends Backbone.View
  template: _.template '
    <button class="btn btn-default hit-button">Hit</button> <button class="btn btn-default stand-button">Stand</button>

    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': -> @model.get('dealerHand').stand()
    
  comparescores: ->
    if @model.get('playerHand').scores()[0] > @model.get('dealerHand').scores()[0]
      alert("Dealer Wins")
    else
      alert("Player Wins")
    

  initialize: ->
    @comparescores
    @render()
    @model.get('playerHand').on('reset', =>
      @$el.children().detach()
      @$el.html @template()
      @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
      @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
    )
    @model.get('dealerHand').on('reset', =>
      @$el.children().detach()
      @$el.html @template()
      @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
      @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
    )

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

