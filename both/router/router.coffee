Router.configure
  templateNameConverter: "upperCamelCase"
  routeControllerNameConverter: "upperCamelCase"
  layoutTemplate: "layout"
  notFoundTemplate: "notFound"
  loadingTemplate: "loading"

Router.map ->
  @route "home",
    path: "/"
    controller: "HomeController"

  @route "guide",
    path: "/guide"
    controller: "AboutController"

  @route "rules",
    path: "/rules"
    controller: "RulesController"

  @route "combat",
    path: "/combat"
    controller: "CombatController"

  @route "politics",
    path: "/politics"
    controller: "PolticsController"

  return
