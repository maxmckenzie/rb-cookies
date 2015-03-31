# rb-cookies
scrape a website for all the cookies used. Useful when someone asks you to audit a cookie policy.

## How it Works.

This script allows one to scrape a list of URLs and get back a json file of all the cookies that are present on those URLs.

## How to Use

### Get you'r dependances together.

You need to have ruby installed https://www.ruby-lang.org/en/documentation/installation/

once you have that you can get the webdriver watir by typing `gem install watir` into terminal

I've used chrome as the automated browser. To get this to work you will need to install chrome driver https://sites.google.com/a/chromium.org/chromedriver/downloads

### Mess with the code

Clone the repo
`git clone https://github.com/maxmckenzie/rb-cookies.git`

Add all the URLs you want to parse as a csv file in siteurls.csv

Use terminal to `cd` into the rb-cookies directory

then run

`ruby urlrunner.rb`

Then sit back and watch that sexy sexy automated browser do its thing.

It will output all the results to a file named cookies.json

#### Aditional Options.

you can run the script to give you back every cookie but remove duplicates by uncommenting this line

`
 # Remove Duplicates
 #c = a.flatten.uniq
`

and commenting out this line

`
 # Remove all Duplicates based on the name of the cookie.
 c = a.flatten.uniq! { |a| a[:name] }
`

or the other way around.

if you want you can uncomment these lines

`
 #count += 1
 #break if count == 10
`

This of course breaks after ten. So you can test it out with out having to parse the 500+ URLs i had to.

## Credits

Credit to Craig Merrilees (whos not on github GASSSPPP). Hes an increadbly talented guy none the less. Without whom this would have not been possible.