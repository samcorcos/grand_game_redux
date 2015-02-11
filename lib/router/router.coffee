Router.configure
  layoutTemplate: "layout"
  notFoundTemplate: "notFound"
  loadingTemplate: "loading"

Router.map ->
  @route "home",
    path: "/"

  @route "guide",
    path: "/guide"

  @route "rules",
    path: "/rules"

  @route "combat",
    path: "/combat"

  @route "politics",
    path: "/politics"

  @route 'admin',
    path: "/admin"

  @route 'purchase',
    path: '/purchase'

  return
