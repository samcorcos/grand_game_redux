Template._airCombat.rendered = ->
  AirCombat.remove {}
  AirCombat.insert
    planes: 0
  AirCombat.insert
    planes: 0

Template._airCombat.helpers
  airCombatants: ->
    AirCombat.find()

  preAirCombat: -> Session.get 'airStatus'
  airResults: -> Session.get 'airResults'

Template._airCombat.events
  'keyup #name': (e,t) ->
    AirCombat.update
      _id: @_id
    ,
      $set:
        name: e.target.value

  'keyup #planes': (e,t) ->
    AirCombat.update
      _id: @_id
    ,
      $set:
        planes: e.target.value


  'click #add-air': (e,t) ->
    e.preventDefault()
    AirCombat.insert {}

  'click #submit-air': (e,t) ->
    e.preventDefault()
    calculateAir()

@getAirWinArray = (combatants) ->
  strengthArray = []
  totalStrength = 0
  combatants.forEach (combatant) ->
    totalStrength += +combatant.planes
    strengthArray.push +combatant.planes
  scaledArray = []
  strengthArray.forEach (item) ->
    scaledArray.push(item/totalStrength)
  scaledArray

@calculateAir = ->
  combatants = AirCombat.find().fetch()
  winArray = getAirWinArray combatants
  winnerIndex = getWinnerIndex winArray
  winnerName = combatants[winnerIndex].name
  casualties = getAirCasualties combatants
  # superiority = getAirSuperiority combatants, casualties
  tempArray = []
  i = 0
  combatants.forEach (combatant) ->
    combatant.casualties = casualties[i]
    tempArray.push combatant
    i++
  Session.set 'airResults', tempArray
  Session.set 'airStatus', false

@getAirCasualties = (combatants) ->
  ak = 0.5
  strengthArray = []

  # Gets the total combat strength of all parties
  combatants.forEach (combatant) ->
    strengthArray.push +combatant.planes
  killsArray = []
  i = 0

  # Calculates the number of kills
  strengthArray.forEach (strength) ->
    j = 0
    kills = 0
    while j < strength
      x = Math.random()
      if x < ak
        kills++
      j++
    killsArray[i] = kills
    i++

  # Converts kills into casualties TODO only works with two combatants
  casualtyArray = killsArray.reverse()
  i = 0

  # Testing to make sure you don't have more casualties than units
  casualtyArray.forEach (casualty) ->
    if casualty > strengthArray[i]
      casualtyArray[i] = strengthArray[i]
    i++
  casualtyArray
