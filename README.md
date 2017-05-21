# Weather
A little project to show a city weather.

[![Build Status](https://travis-ci.org/giordanofalves/weather.svg?branch=master)](https://travis-ci.org/giordanofalves/weather) [![Code Climate](https://codeclimate.com/github/giordanofalves/weather/badges/gpa.svg)](https://codeclimate.com/github/giordanofalves/weather) [![Test Coverage](https://codeclimate.com/github/giordanofalves/weather/badges/coverage.svg)](https://codeclimate.com/github/giordanofalves/weather/coverage)

* Ruby version: 2.4.0
* Rails version: 5.1.0

## Synopsis
I created this project to a job test.
You can access this project here: [https://gimail.herokuapp.com](https://gimail.herokuapp.com)

My goals are:

* A beautiful code
* Min 95% code covered by specs
* Use great tools like Travis CI, Code Climate and SimpleCov
* A good layout(my weakness)
* Publish this project in heroku server
* Search city page(with google place api)
* An weather interface that:
  * List a week days and your weather
  * Show de current weather with:
    * City name;
    * Week day;
    * Current weather;
    * Wind speed;
* Click in another days to see more content.



## Installing

```console
git clone https://github.com/giordanofalves/weather.git
cp config/secrets.yml.example config/secrets.yml
bundle install
```
Update your database credentials in secrets.yml file.

## System dependencies
### Google API

###### How to get a key
  Access [https://developers.google.com/places/web-service/](https://developers.google.com/places/web-service/) and click in Get a Key.

###### Config Google API in Weather
  Edit a file [config/secrets.yml](https://github.com/giordanofalves/weather/blob/master/config/secrets.yml) and add your credentials.

  ```
    default: &api
      google_api:
        key: "YOUR API KEY"
  ```
### Open Weather Map API

###### How to get a key
  Access [https://openweathermap.org/price](https://openweathermap.org/price) and click in Get a Api key and tart.

###### Config Google API in Weather
  Edit a file [config/secrets.yml](https://github.com/giordanofalves/weather/blob/master/config/secrets.yml) and add your credentials.

  ```
    default: &api
      openweathermap_api:
        key: "YOUR API KEY"
  ```

## How to run the test suite
```console
rspec ./spec
```
