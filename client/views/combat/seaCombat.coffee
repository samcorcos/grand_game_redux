Template._seaCombat.rendered = ->
  SeaCombat.remove {}
  SeaCombat.insert {}
  SeaCombat.insert {}

Template._seaCombat.helpers
  seaCombatants: ->
    SeaCombat.find()
