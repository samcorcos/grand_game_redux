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
