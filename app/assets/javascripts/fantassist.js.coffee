window.Fantassist =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  EventBus: _.extend {}, Backbone.Events

# helper function for Hogan Templates
Fantassist.template = (filename) -> HoganTemplates[filename]

#$(document).ready ->
  #Fantassist.initialize()
