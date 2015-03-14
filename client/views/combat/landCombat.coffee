Template._landCombat.rendered = ->
  LandCombat.remove {}
  LandCombat.insert {}
  LandCombat.insert {}

Template._landCombat.helpers
  landCombatants: ->
    LandCombat.find()

Template._landCombat.events
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
