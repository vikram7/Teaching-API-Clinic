# API Clinic Rough Notes

## What is an API?

- Application Programming Interface
  - It's a set of rules, code, specifications that software programs use to communicate with one another
  - It's an interface between different software programs so that they can communicate with one another

- You use an API all the time here which you started in your prework and do now
  - The Ruby API. The Ruby API is the set of code and rules that let you interface with the interpreter
  - http://ruby-doc.org/stdlib-2.2.2/

- The kinds of APIs we will talk about today are the ones related to web development
- Pretty much all the websites you deal with deal with an API

## Example Web APIs

- Goodreads
  - Go to goodreads site -- take a look at all the APIs that are used (fb, twtr, amzn, googl)
  - They use Amazon's API for actual book information as well
  - Example: https://www.goodreads.com/book/show/40445.Altered_Carbon

## Importance of Standardization

- We're in a really exciting period in web development right now for two reasons
- Most companies are starting to offer APIs, many of which are totally free to use

AND

- Because of APIs getting standardized, you can hook up to an API very quickly and start writing apps with it
- JSON is one kind of standard that helps with this
- JSON stands for JavaScript Object Notation
- What JSON lets an API do is provide some data in a standardized format
- So what does JSON look like?

## StackOverflow API
- https://api.stackexchange.com/docs
- See all questions and see what the JSON looks like
- BTW, the reason the JSON looks like this is because I have a chrome plugin installed called JSONView. If we didn't have that installed, it would look like this. Go to Chrome Private Window
- Walk through what that JSON looks like
- So how do we get this data?

## HTTParty
- https://github.com/jnunemaker/httparty
- HTTParty is a library that lets us make http requests with Ruby
- Why is that cool?

## A Simple Sinatra App Using the Stack Overflow API
- Let's look at the API data that's coming through, what can we do?
- Tag count

## We can create our own API using the Stack Overflow API
- require 'sinatra/json'
- get '/api/v1/tags'

```ruby
require 'sinatra'
require 'sinatra/json'
require 'httparty'
require 'pry'

get '/api/v1/tags' do
  response = HTTParty.get('https://api.stackexchange.com/2.2/questions?order=desc&sort=activity&site=stackoverflow')
  tags = Hash.new 0
  questions = response["items"]
  questions.each do |question|
    question["tags"].each do |tag|
      tags[tag] += 1
    end
  end
  json tags
end
```

## Here are some APIs you should check out if you're interested in learning more (which you should be)

- Stack Overflow API
  - [docs link](https://api.stackexchange.com/docs)
- Twilio: SMS/Messaging API. Lets you send SMS/MMS from a server to a phone.
  - [tutorial link](https://github.com/LaunchAcademy/twilio-intro)
- Tradier: Stock Market API
  - [tutorial link](http://vikramis.me/2015/05/10/the-tradier-api-and-historical-stock-data-return-visualization/)
- Instagram: Photo sharing site API, search by location
- Stripe API
- Look into anything you're interested in and see if there's an API available

## Can't find the API you want?
- Make it!
