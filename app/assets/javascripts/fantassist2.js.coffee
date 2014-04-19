window.Fantassist2 =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: -> alert 'Hello from Backbone!'

# helper function for Hogan Templates
Fantassist2.template = (filename) -> HoganTemplates[filename]

#$(document).ready ->
  #Fantassist2.initialize()
