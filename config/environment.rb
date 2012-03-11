# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Website::Application.initialize!
Time::DATE_FORMATS[:dateformat] = "%A %B %d, %Y"