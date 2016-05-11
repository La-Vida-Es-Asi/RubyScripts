#-----------------------------------------------------------------------------------------#
# QA Simple Web Validation Script Template
# by: Ms. Casas
# 5/10/16
#
# This little script opens a browser as selected by the tester in the code and inputs
# some data into different fields as specified by the tester.  It then checks
# against some criteria listed by the testerand outputs whether or not that test passes.
# It's intended to serve as a general template and will really need to be customized by user.
# This script assumes the user has the Watir gem installed.  Also IEDriverServer and/or a 
# driver for Chrome, if it's desired to work with those 2 browsers.
# 
#-----------------------------------------------------------------------------------------#

require 'watir-webdriver'
require 'logger'

logger = Logger.new("PutFileNameHere.log")                    # Set up your log file
logger.debug("Created logger")
logger.info("Program started.")

#browser = Watir::Browser.new :ie                             # Uncomment to run using IE
browser = Watir::Browser.new :firefox                         # Uncomment to run using Firefox
#browser = Water::Browser.new :chrome                         # Uncomment to run using Chrome
test_site = "http://www.SomeWebsite.com"                      # Enter the website to test here

puts " "
puts ".........................................."
puts "BEGINNING OF TEST........"
puts ".........................................."
browser.goto test_site

browser.text_field(:placeholder, "CCNs").set "987"            # Enter the field name & value to input for test here
browser.text_field(:placeholder, "Year").set "2016"           # Enter the field name & value to input for test here
1000.times {puts "waiting..."}                                # Uncomment this line if running Firefox
browser.select_list(:name, "startSampleMonth").select_value("5")  # Enter the start month you want here (drop down value) - Months are numbered 1-12.
browser.select_list(:placeholder, "End Month").select_value("13") # Uncomment if you want to use an End Month
#browser.text_field(:name, "maximumNumberOfFilesInZip").set "250" # Enter the number of files you want to include in the zip file here

browser.button(:name, "btnGenerate").click                    # Enter the button name here
puts "Actual result:"
if browser.text.include? ("someText" || "someOtherText")
	if browser.text.include? "Your request has been received"
		puts "Test has passed."
	elsif browser.text.include? "someTextToCheckFor"            # Enter the condition you're checking for here, in this case some text I expect to see
		puts "Test passed."
	else
		puts "Test didn't pass."
	end
end
	
