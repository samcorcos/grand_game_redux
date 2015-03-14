@LandCombat = new Mongo.Collection null
@SeaCombat = new Mongo.Collection null
@AirCombat = new Mongo.Collection null

Template.combat.rendered = ->
  $('ul.tabs').tabs()
  LandCombat.remove {}
  LandCombat.insert {}
  LandCombat.insert {}

Template.combat.events
  'click #air-tab': (e,t) ->
    Session.set 'airStatus', true
    Session.set 'landStatus', false
    Session.set 'seaStatus', false

  'click #land-tab': (e,t) ->
    Session.set 'airStatus', false
    Session.set 'landStatus', true
    Session.set 'seaStatus', false

  'click #sea-tab': (e,t) ->
    Session.set 'airStatus', false
    Session.set 'landStatus', false
    Session.set 'seaStatus', true

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
