== README

### LocalMotion

You can find this app in production at:

https://localmotion.me

#### Pitch

The Kayak of local travel.
See all ride sharing options in your immediate area.

#### Description

The emergence of numerous community-based transportation options (i.e., ride
sharing) is great yet with people having memberships to many of the offered services,
it can be difficult to compare and choose the best option at any given time and
location.

This app will aggregate all Denver ride sharing options within a one to two mile
radius of the user such as Uber, Lyft, B-Cycle, and Car2Go.  The results will be
filterable by distance and/or price and show the best route between the user and
their final destination.

#### Target Audience

This application will be geared toward Denverites who take advantage of local
travel ride sharing options and attempt to maintain a low-carbon footprint.

#### Integrations

* OAuth provider:
  Uber OAuth

* API use:
- Uber API
- Car2Go API
- B-Cycle API is currently out of service:
     - https://code.google.com/p/share-a-bike/wiki/BCycleAPI
  Use open public data source:
     - http://data.opencolorado.org/dataset/city-and-county-of-denver-b-cycle-stations

* Other integrations:
Google Maps


# Details

* Ruby version 2.1.2

* System dependencies

* Configuration

* Database creation
```
rake db:create
```

* Database initialization
```
rake db:migrate
```

* How to run the test suite
```
bundle exec rspec
```

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
