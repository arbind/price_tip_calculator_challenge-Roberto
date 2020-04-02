# Price Tip Calculator & Shopping Cart
This is Recess' public facing website.

It is visited by Event Organizers as well as Brand Advertisers.

Currently there are 2 pages you can get to in the main menu:

  - [Sponsor Events](http://localhost:3000) - the homepage
  - [List An Event](http://localhost:3000/for_events) - a landing page

## Overview
Event Organizers offer various spaces at their event - such as a 10x10 booth or a spot for a food truck to park and serve food/drinks. An Advertiser can book one of these spaces in ordr to promote their brand, and want to know their cost.

The price calculator `PricingService#suggested_price_tip_in_cents` is already given, which provides a function to calculate a price tip based on the following inputs:

  - reach: expected attendance at the event
  - duration: number of hours the event will be held for
  - space_type: the type of space desired: e.g a booth or food truck

## Objective
Add a 3rd page to the website that provides a dynamic price calculator. Update the main nav bar to always have the following link:

  - [Pricing](http://localhost:3000/pricing)

## Instructions

### 1 Set up your dev environment

```
+ install mongodb
+ install ruby '2.5.3' (feel free to change gemfile to use any ruby version you want)
```

### 2 Run the specs
```
rspec
open coverage/index.html
```


### 3 Start The Server
```
bundle
rails s
# visit localhost:3000
```

### 4 Add the pricing page, widgetize it, and implement a shopping cart
[Implement these stories](https://pivotaltracker.com/0000).

  - The project starts with the Price Tip Calculator implemented as a standard request-response page.
  - Then the Price Tip Calculator is re-implemented as a javascript widget - no login needed but will need to enter email
  - Then a shopping cart is implmented to capture leads - the shopping cart saved for the email entered, and purchase will simpl sends an email to lead@recess.is

  * Don't worry about the styling, We'll be evaluation your ability to build the functioanlity of the price tip calculator and shopping cart.
