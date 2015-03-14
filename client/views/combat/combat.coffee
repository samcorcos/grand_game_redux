@LandCombat = new Mongo.Collection null
@SeaCombat = new Mongo.Collection null
@AirCombat = new Mongo.Collection null

Template.combat.rendered = ->
  $('ul.tabs').tabs()
  LandCombat.remove {}
  LandCombat.insert {}
  LandCombat.insert {}

Template.combat.events {}

Template.combat.helpers
  combatant: ->
    Combatant.find()


@getWinnerIndex = (array) ->
  x = Math.random()
  res = 0
  for v,i in array
    if x < array[i]
      res = i
  res

@getWinArray = (combatants) ->
  strengthArray = []
  totalStrength = 0
  combatants.forEach (combatant) ->
    totalStrength += +combatant.planes
    strengthArray.push +combatant.planes
  scaledArray = []
  strengthArray.forEach (item) ->
    scaledArray.push(item/totalStrength)
  scaledArray
