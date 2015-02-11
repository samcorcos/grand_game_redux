Template._landCombat.rendered = ->
  LandCombat.remove {}
  LandCombat.insert {}
  LandCombat.insert {}

Template._landCombat.helpers
  landCombatants: ->
    LandCombat.find()
