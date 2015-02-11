Template.admin.events
  'keypress input.login-password': (e,t) ->
      if e.keyCode is 13
        Meteor.loginWithPassword t.find('#username').value, t.find('#password').value, (err) ->
          $('#password').val("")
          alert "Incorrect username/password", 3000 if err
      return

# TODO we want this with accounts UI
