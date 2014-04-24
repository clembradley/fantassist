window.Fantassist2 =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  events: _.extend {}, Backbone.Events

# helper function for Hogan Templates
Fantassist2.template = (filename) -> HoganTemplates[filename]

#$(document).ready ->
  #Fantassist2.initialize()
