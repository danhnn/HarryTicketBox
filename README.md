# Homework 3 - *Harry Ticketbox*

**Harry Ticketbox** is a Ruby on Rails blog application that allows users to create and buy tickets to cool events. 

Submitted by: **Nguyễn Ngọc Danh (Harry)**

Time spent: **18** hours

URL: **https://harry-ticketbox.herokuapp.com/**

SimpleCov Test Coverage: **92.61% covered at 1.16 hits/line**

## User Stories

The following **required** functionality is complete:

* [x] 10 model tests, 2 route tests, 2 controller tests, 2 view tests.

#### Events

* [x] Users can see a list of upcoming events. Past events should not be shown. **HINT**: Good candidate for a test.
* [x] Users can search for events from the homepage.
* [x] Users can click on an event to see details about the event. 
* [x] Users can click on "Book Now" to go to a page to purchase tickets.

#### Tickets

* [x] Each event can have multiple types of tickets, each with a different `price` and `max_quantity`. 
* [x] Users can buy tickets to an event, choose the types of tickets, and the quantity of tickets.
* [x] Users cannot buy more tickets than the quantity available.
* [x] Users can only buy up to 10 of a ticket type at a time.
* [x] Users cannot buy tickets to events that occur in the past. 

#### Users

* [x] User can sign up by providing their email, password, and name. 
* [x] User can login using an email and password. 
* [x] Users can create events. 
* [x] Users must click "publish event" before an event becomes viewable to other users. 
* [x] Users can create ticket types for that event. 
* [x] Users can create venues.
* [x] An event must have at least one `ticket_type` defined before it can be published. 
* [x] User can see a list of events he or she has created.
* [x] Users can edit their event after creation. But only the user who created the event can edit the event. 

### Optional Stories

* [ ] Users can log in with Facebook.
* [ ] Users receive an email when they have purchased a ticket.
* [ ] Users can see "related events" when browsing an event. Related events should belong to the same category and be in the same region.
* [ ] User A can allow User B to edit User A's event. In other words, an event owner can assign other people to be "event admins". 
* [ ] Ticket types have an optional "minimum" purchase quantity. ([Example Screenshot](http://i.imgur.com/DOYtAR0.png))
* [ ] Events are automatically labeled as "Hot". "Hot" events should have a red border or some sort of visual flourish. The event title should also be prefixed with "**HOT:**".
* [ ] Instead of showing all of the events on the main page, an "admin" user can dictate the events that show up on the main page.

## Notes

Describe any challenges encountered while building the app.

## Video Walkthrough

Here's a walkthrough of implemented user stories:

![Video Walkthrough](blog_feature.gif)

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## License

    Copyright [yyyy] [name of copyright owner]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
