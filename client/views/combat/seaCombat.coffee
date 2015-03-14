Template._seaCombat.rendered = ->
  SeaCombat.remove {}
  SeaCombat.insert {}
  SeaCombat.insert {}

Template._seaCombat.helpers
  seaCombatants: -> SeaCombat.find()

  preSeaCombat: -> # Session.get 'seaStatus'
    true

  seaResults: -> Session.get 'seaResults'
  seaWinner: -> Session.get 'seaWinner'

Template._seaCombat.events

  'click #submit-sea': (e,t) ->
    e.preventDefault()
    calculateSea()

  'keyup #name': (e,t) ->
    SeaCombat.update
      _id: @_id
    ,
      name: e.target.value

  'keyup #air': (e,t) ->
    SeaCombat.update
      _id: @_id
    ,
      $set:
        air: e.target.value

  'keyup #sLtFleets': (e,t) ->
    SeaCombat.update
      _id: @_id
    ,
      $set:
        sLtFleets: e.target.value

  'keyup #sSubs': (e,t) ->
    SeaCombat.update
      _id: @_id
    ,
      $set:
        sSubs: e.target.value

  'keyup #uSubs': (e,t) ->
    SeaCombat.update
      _id: @_id
    ,
      $set:
        uSubs: e.target.value

  'keyup #uLtFleets': (e,t) ->
    SeaCombat.update
      _id: @_id
    ,
      $set:
        uLtFleets: e.target.value

  'keyup #uHvFleets': (e,t) ->
    SeaCombat.update
      _id: @_id
    ,
      $set:
        uHvFleets: e.target.value

  'keyup #sHvFleets': (e,t) ->
    SeaCombat.update
      _id: @_id
    ,
      $set:
        sHvFleets: e.target.value

@calculateSea = ->
  combatants = SeaCombat.find().fetch()
  winArray = getSeaWinArray combatants
  console.log winArray


  # combatants = AirCombat.find().fetch()
  # winArray = getAirWinArray combatants
  # winnerIndex = getWinnerIndex winArray
  # winnerName = combatants[winnerIndex].name
  # casualties = getAirCasualties combatants
  # # superiority = getAirSuperiority combatants, casualties
  # tempArray = []
  # i = 0
  # combatants.forEach (combatant) ->
  #   combatant.casualties = casualties[i]
  #   tempArray.push combatant
  #   i++
  # Session.set 'airResults', tempArray
  # Session.set 'airStatus', false

@getSeaWinArray = (combatants) ->
  strengthArray = []
  totalStrength = 0
  combatants.forEach (c) ->
    combatantStrength = 0

    totalStrength += 0 # +c.air
    totalStrength += +c.sLtFleets * 3
    totalStrength += +c.uLtFleets
    totalStrength += +c.sHvFleets * 6
    totalStrength += +c.uHvFleets
    totalStrength += +c.sSubs
    totalStrength += +c.uSubs

    combatantStrength += 0 # +c.air
    combatantStrength += +c.sLtFleets * 3
    combatantStrength += +c.uLtFleets
    combatantStrength += +c.sHvFleets * 6
    combatantStrength += +c.uHvFleets
    combatantStrength += +c.sSubs
    combatantStrength += +c.uSubs

    strengthArray.push combatantStrength

  scaledArray = []
  strengthArray.forEach (item) ->
    scaledArray.push(item/totalStrength)
  scaledArray
