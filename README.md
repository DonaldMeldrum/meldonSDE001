# meldonSDE001

Script to fetch last 8 posts on Expedia Facebook Page and save to a local file in JSON format.

### Prerequisites

Install ruby gem nokogiri

```
Give examples
```

### Installing

First, make sure you have the latest version of RubyGems and xcode commandline tools:

```
gem update --system
xcode-select --install # Then agree to the terms, even if you have done this before!
```

Then install nokogiri:
```
gem install nokogiri
```

If there's any issues refer to http://www.nokogiri.org/tutorials/installing_nokogiri.html#install_with_custom___non_standard_libraries

### Running the script

From command line:
```
ruby fb_expedia.rb
```

If successful, a file is created in the current directory with the name format: fb-expedia-posts_{timestamp}.json
Otherwise, an error message will display with the accompanying exception message.

### How it works

* Get html source using open-uri
* Use Nokogiri gem to parse html
* Use XPath to extract first 8 non-nil posts
* Use Nokogiri to backtrace from Post element to Post's timestamp element (This technique was necessary to exclude timestamps from non-post elements)
* Create a hash for each post: {:postText => post.text, :timeStamp => timeStamp }
* Use json gem to convert array of hashes into JSON array
* Write JSON array string to file in current directory