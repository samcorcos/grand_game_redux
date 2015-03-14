Template._landCombat.rendered = ->
  LandCombat.remove {}
  LandCombat.insert {}
  LandCombat.insert {}

Template._landCombat.helpers
  landCombatants: -> LandCombat.find()

  preLandCombat: -> Session.get 'landStatus'
  landResults: -> Session.get 'landResults'
  landWinner: -> Session.get 'landWinner'

Template._landCombat.events
  'click #submit-land': (e,t) ->
    e.preventDefault()
    calculateLand()


  'keyup #name': (e,t) ->
    LandCombat.update
      _id: @_id
    ,
      $set:
        name: e.target.value

  'keyup #air': (e,t) ->
    LandCombat.update
      _id: @_id
    ,
      $set:
        air: e.target.value

  'keyup #s-res-inf': (e,t) ->
    LandCombat.update
      _id: @_id
    ,
      $set:
        sResInf: e.target.value

  'keyup #u-res-inf': (e,t) ->
    LandCombat.update
      _id: @_id
    ,
      $set:
        uResInf: e.target.value

  'keyup #s-inf': (e,t) ->
    LandCombat.update
      _id: @_id
    ,
      $set:
        sInf: e.target.value

  'keyup #u-inf': (e,t) ->
    LandCombat.update
      _id: @_id
    ,
      $set:
        uInf: e.target.value

  'keyup #s-arm': (e,t) ->
    LandCombat.update
      _id: @_id
    ,
      $set:
        sArm: e.target.value

  'keyup #u-arm': (e,t) ->
    LandCombat.update
      _id: @_id
    ,
      $set:
        uArm: e.target.value

  'keyup #rockets': (e,t) ->
    LandCombat.update
      _id: @_id
    ,
      $set:
        rockets: e.target.value

  'change [id$="-pen1"]': (e,t) ->
    if t.find('[id$="-pen1"]:checked')
      LandCombat.update
        _id: @_id
      ,
        $set:
          pen1: true
    else
      LandCombat.update
        _id: @_id
      ,
        $set:
          pen1: false

  'change [id$="-pen2"]': (e,t) ->
    if t.find('[id$="-pen2"]:checked')
      LandCombat.update
        _id: @_id
      ,
        $set:
          pen2: true
    else
      LandCombat.update
        _id: @_id
      ,
        $set:
          pen2: false

  'change [id$="-md"]': (e,t) ->
    if t.find('[id$="-md"]:checked')
      LandCombat.update
        _id: @_id
      ,
        $set:
          md: true
    else
      LandCombat.update
        _id: @_id
      ,
        $set:
          md: false

  'change [id$="-cd"]': (e,t) ->
    if t.find('[id$="-cd"]:checked')
      LandCombat.update
        _id: @_id
      ,
        $set:
          cd: true
    else
      LandCombat.update
        _id: @_id
      ,
        $set:
          cd: false

  'change [id$="-bz"]': (e,t) ->
    if t.find('[id$="-bz"]:checked')
      LandCombat.update
        _id: @_id
      ,
        $set:
          bz: true
    else
      LandCombat.update
        _id: @_id
      ,
        $set:
          bz: false

  'change [id$="-bd"]': (e,t) ->
    if t.find('[id$="-bd"]:checked')
      LandCombat.update
        _id: @_id
      ,
        $set:
          bd: true
    else
      LandCombat.update
        _id: @_id
      ,
        $set:
          bd: false

  'change [id$="-hd"]': (e,t) ->
    if t.find('[id$="-hd"]:checked')
      LandCombat.update
        _id: @_id
      ,
        $set:
          hd: true
    else
      LandCombat.update
        _id: @_id
      ,
        $set:
          hd: false

  'change [id$="-atmb"]': (e,t) ->
    if t.find('[id$="-atmb"]:checked')
      LandCombat.update
        _id: @_id
      ,
        $set:
          atmb: true
    else
      LandCombat.update
        _id: @_id
      ,
        $set:
          atmb: false

  'change [id$="-wd"]': (e,t) ->
    if t.find('[id$="-wd"]:checked')
      LandCombat.update
        _id: @_id
      ,
        $set:
          wd: true
    else
      LandCombat.update
        _id: @_id
      ,
        $set:
          wd: false

  'change [id$="-o"]': (e,t) ->
    if t.find('[id$="-o"]:checked')
      LandCombat.update
        _id: @_id
      ,
        $set:
          o: true
    else
      LandCombat.update
        _id: @_id
      ,
        $set:
          o: false

  'change [id$="-d"]': (e,t) ->
    if t.find('[id$="-d"]:checked')
      LandCombat.update
        _id: @_id
      ,
        $set:
          d: true
    else
      LandCombat.update
        _id: @_id
      ,
        $set:
          d: false

  'keyup #base-change': (e,t) ->
    LandCombat.update
      _id: @_id
    ,
      $set:
        base: e.target.value

@getArmor = (c) ->
  numArm = +c.sArm
  result = undefined
  if c.o
    armStrength = 6
    if c.pen1 then armStrength--
    if c.pen2 then armStrength--
    grossStrength = numArm * armStrength
    if c.bz then grossStrength *= 2
    if c.bd then grossStrength *= 1.25
    if c.atmb then grossStrength += 12
    result = grossStrength
  else
    armStrength = 6
    if c.pen1 then armStrength--
    if c.pen2 then armStrength--
    grossStrength = numArm * armStrength
    if c.md then grossStrength *= 1.1
    if c.cd then grossStrength *= 1.1
    if c.wd then grossStrength *= 1.05
    if c.hd then grossStrength *= 1.25
    result = grossStrength
  if result then result else 0


@getInfantry = (c) ->
  result = undefined
  if c.o
    infStrength = 3
    if c.pen1 then infStrength--
    if c.pen2 then infStrength--
    grossStrength = +c.sInf * infStrength
    if c.atmb then grossStrength += 12
    result = grossStrength
  else
    infStrength = 4
    if c.pen1 then infStrength--
    if c.pen2 then infStrength--
    grossStrength = +c.sInf * infStrength
    if c.md then grossStrength *= 1.1
    if c.cd then grossStrength *= 1.1
    if c.wd then grossStrength *= 1.05
    if c.hd then grossStrength *= 1.25
    result = grossStrength
  if result then result else 0

@getResInfantry = (c) ->
  result = undefined
  if c.o
    resStrength = 2
    if c.pen1 then resStrength--
    if c.pen2 then resStrength--
    grossStrength = +c.sResInf * resStrength
    if c.atmb then grossStrength += 12
    result = grossStrength
  else
    resStrength = 4
    if c.pen1 then resStrength--
    if c.pen2 then resStrength--
    grossStrength = +c.sResInf * resStrength
    if c.md then grossStrength *= 1.1
    if c.cd then grossStrength *= 1.1
    if c.wd then grossStrength *= 1.05
    if c.hd then grossStrength *= 1.25
    result = grossStrength
  if result then result else 0

@getStrengthArray = (combatants) ->
  strengthArray = []
  combatants.forEach (c) ->
    combatantStrength = 0

    combatantStrength += +c.air       # TODO what is "1/sup. pt."
    combatantStrength += getArmor(c)
    combatantStrength += getInfantry(c)
    combatantStrength += getResInfantry(c)
    combatantStrength += +c.uArm
    combatantStrength += +c.uInf
    combatantStrength += +c.uResInf

    strengthArray.push combatantStrength
  strengthArray


@getLandWinArray = (combatants) ->
  strengthArray = []
  totalStrength = 0
  combatants.forEach (c) ->
    combatantStrength = 0

    totalStrength += +c.air      # TODO what is "1/sup. pt."
    totalStrength += getArmor(c)
    totalStrength += getInfantry(c)
    totalStrength += getResInfantry(c)
    totalStrength += +c.uArm # TODO do unsupplied units get bonuses?
    totalStrength += +c.uInf # TODO can a unit have less than 1 attack or defense? Negative?
    totalStrength += +c.uResInf


    combatantStrength += +c.air       # TODO what is "1/sup. pt."
    combatantStrength += getArmor(c)
    combatantStrength += getInfantry(c)
    combatantStrength += getResInfantry(c)
    combatantStrength += +c.uArm
    combatantStrength += +c.uInf
    combatantStrength += +c.uResInf

    strengthArray.push combatantStrength

  scaledArray = []
  strengthArray.forEach (item) ->
    scaledArray.push(item/totalStrength)
  scaledArray

@calculateLand = ->
  combatants = LandCombat.find().fetch()
  winArray = getLandWinArray combatants
  winnerIndex = getWinnerIndex winArray
  console.log winArray
  combatWinner = combatants[winnerIndex].name
  casualties = getLandCasualties combatants
  tempArray = []
  i = 0
  combatants.forEach (c) ->
    c.casualties = casualties[i]
    tempArray.push c
    i++
  Session.set 'landWinner', combatWinner
  Session.set 'landResults', tempArray
  Session.set 'landStatus', false

@getLandCasualties = (combatants) ->
  lk = 0.05
  strengthArray = getStrengthArray combatants

  # calculates number of kills
  killsArray = []
  i = 0
  strengthArray.forEach (strength) ->
    j = 0
    kills = 0
    while j < strength
      x = Math.random()
      if x < lk
        kills++
      j++
    killsArray[i] = kills
    i++

  # Converts kills into casualties TODO only works with two combatants
  casualtyArray = killsArray.reverse()

  unitsArray = [] # populates array of unit types
  combatants.forEach (c) ->
    xArray = []
    xArray.push unitCount("Air", c.air)
    xArray.push unitCount('Supplied Armor', c.sArm)
    xArray.push unitCount('Supplied Infantry', c.sInf)
    xArray.push unitCount('Supplied Res. Infantry', c.sResInf)
    xArray.push unitCount('Unsupplied Armor', c.uArm)
    xArray.push unitCount('Unsupplied Infantry', c.uInf)
    xArray.push unitCount('Unsupplied Res. Infantry', c.uResInf)
    xArray.push unitCount('Rocket', c.rockets)
    unitsArray.push _.flatten(xArray)

  # shuffle and show losses
  i = 0
  lossesArray = []
  unitsArray.forEach (army) ->
    newArmy = _.shuffle(army)
    deaths = casualtyArray[i]
    casualties = newArmy.slice(0,deaths)
    lossesArray.push casualties
    i++
  lossesArray

@unitCount = (type ,c) ->
  i = 0
  tempArray = []
  while i < c
    tempArray.push type
    i++
  tempArray
