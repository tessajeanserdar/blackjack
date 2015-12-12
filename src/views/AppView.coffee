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
    if @model.get('playerHand').scores()[0] >=21
      @model.get('playerHand').bust()
      alert("player score #{@model.get('playerHand').scores()[0]}  dealer score#{@model.get('dealerHand').scores()[0]}")
    

  initialize: ->
    @comparescores
    @render()
    @model.on('busted', )


  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

