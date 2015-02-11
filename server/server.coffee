Meteor.startup ->
  if Meteor.users.find().count() is 0

    Accounts.createUser
      username: "samcorcos"
      password: "sampassword"
      profile:
        roles: ["admin"]

    Accounts.createUser
      username: "mrbutler"
      password: "butlerpassword"
      profile:
        roles: ["admin"]


Accounts.config
  forbidClientAccountCreation : true
