Template.home.rendered = ->
  Meteor.setTimeout (->
    $(".home-card-1").addClass("show-card")
    return
  ), 500

  Meteor.setTimeout (->
    $(".home-card-2").addClass("show-card")
    return
  ), 1000

  Meteor.setTimeout (->
    $(".home-card-3").addClass("show-card")
    return
  ), 1500

Template.home.events {}

Template.home.helpers {}
