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
  winnerIndex = getWinnerIndex winArray
  winnerName = combatants[winnerIndex].name
  Session.set 'seaWinner', winnerName
  console.log winArray
  casualties = getSeaCasualties combatants
  tempArray = []
  i = 0
  combatants.forEach (c) ->
    c.casualties = casualties[i]
    tempArray.push c
    i++
  Session.set 'seaResults', tempArray
  Session.set 'seaStatus', false

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

@getSeaCasualties = (combatants) ->
  sk = 0.2
  strengthArray = []
  combatants.forEach (c) ->
    combatantStrength = 0
    combatantStrength += 0 # TODO +c.air
    combatantStrength += +c.sLtFleets * 3
    combatantStrength += +c.uLtFleets
    combatantStrength += +c.sHvFleets * 6
    combatantStrength += +c.uHvFleets
    combatantStrength += +c.sSubs
    combatantStrength += +c.uSubs
    strengthArray.push combatantStrength

  #calculates number of kills
  killsArray = []
  i = 0
  strengthArray.forEach (strength) ->
    j = 0
    kills = 0
    while j < strength
      x = Math.random()
      if x < sk
        kills++
      j++
    killsArray[i] = kills
    i++

  casualtyArray = killsArray.reverse()

  

#
#   # Converts kills into casualties TODO only works with two combatants
#   casualtyArray = killsArray.reverse()
#
#   unitsArray = [] # populates array of unit types
#   combatants.forEach (c) ->
#     xArray = []
#     xArray.push unitCount("Air", c.air)
#     xArray.push unitCount('Supplied Armor', c.sArm)
#     xArray.push unitCount('Supplied Infantry', c.sInf)
#     xArray.push unitCount('Supplied Res. Infantry', c.sResInf)
#     xArray.push unitCount('Unsupplied Armor', c.uArm)
#     xArray.push unitCount('Unsupplied Infantry', c.uInf)
#     xArray.push unitCount('Unsupplied Res. Infantry', c.uResInf)
#     xArray.push unitCount('Rocket', c.rockets)
#     unitsArray.push _.flatten(xArray)
#
#   # shuffle and show losses
#   i = 0
#   lossesArray = []
#   unitsArray.forEach (army) ->
#     newArmy = _.shuffle(army)
#     deaths = casualtyArray[i]
#     casualties = newArmy.slice(0,deaths)
#     lossesArray.push casualties
#     i++
#   lossesArray
