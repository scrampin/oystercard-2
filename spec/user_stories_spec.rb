# In order to be correctly charged,
# As a customer
# Record entry station
#
#
#
# In order to be correctly charged,
# As a customer,
# Record exit station
#
#
# In order to be correctly charged,
# As a customer,
# Calculate the correct fare
#
#
# In order to be correctly charged,
# As a customer,
# Return whether or not journey is complete?

require './lib/journey'
journey = Journey.new
journey.start("Aldgate")
trip = journey.finish("King's Cross")
