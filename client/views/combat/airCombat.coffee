Template._airCombat.rendered = ->
  AirCombat.remove {}
  AirCombat.insert {}
  AirCombat.insert {}

Template._airCombat.helpers
  airCombatants: ->
    AirCombat.find()

Template._airCombat.events
  'click #add-air': (e,t) ->
    e.preventDefault()
    AirCombat.insert {}

###



###
