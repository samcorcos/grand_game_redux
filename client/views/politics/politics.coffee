Template.politics.rendered = ->
  Session.setDefault 'rolled', false
  Session.setDefault 'loading', false

Template.politics.events
  'click #politics': (e,t) ->
    Session.set 'roll', ""
    Session.set 'loading', true
    Meteor.setTimeout ->
      Session.set 'loading', false
      Session.set 'rolled', true
      Session.set 'roll', Math.floor(Math.random() * 5) + 1
    , 1000

Template.politics.helpers
  rolled: -> Session.get 'rolled'
  roll: -> Session.get 'roll'
  loading: -> Session.get 'loading'
