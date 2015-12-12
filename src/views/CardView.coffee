class window.CardView extends Backbone.View

  el : '<img class="card" />'
  #className: 'card'

  ###template: _.template '<img src = "img/cards/<%= rankName %>-<%= suitName %>.png">'
  ###

  initialize: -> 
    @render()
    
  render: ->
    @$el.children().detach()

    #@$el.html @template @model.attributes
    
    rankName = @model.get('rankName')
    suitName = @model.get('suitName')

    @$el.addClass 'covered' unless @model.get 'revealed'
    if @model.get 'revealed'
      @$el.attr('src', "img/cards/#{rankName}-#{suitName}.png")
    else
      @$el.attr('src', "http://www.jimknapp.com/Cards/Non-Bicycle_files/image002.jpg")


    


