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
