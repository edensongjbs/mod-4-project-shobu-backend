# Shobu Back-end

### A two-player browser version of the [Popular Abstract Strategy Game](https://www.smirkandlaughter.com/shobu)

### Visit the [Front-end Repo](https://github.com/aromsa/shobu)
### Watch a [Video Demo](https://www.youtube.com/watch?v=bavInRxcxUU&t=7s)
### Read a blog entry on the [Game Link Generation](https://dev.to/edensongjbs/generating-dynamic-game-links-with-jwts-56ed) 
### Coming Soon:  Play it for yourself with the deployed demo

## About

**Shobu** is an opportunity to connect with a friend to play an online board game at a time when we can't meet face to face.  The look and feel is modeled off of the original strategy game.  This simple browser game is designed to be easy to use and have a low barrier to entry.  No username or personal information is required.  Just enter a name and an opponents name two unique game links will be generated for you.  You can take a break and pick up where you left off later (on the same device/browser or a completely new one).

## Tech Stack

**Built With**
- React.js
- Ruby on Rails (API) with ActionCable (WebSocket)
- Custom CSS

## Game Rules

  You can find the rules [here](https://364df235-af4b-4f4a-919f-d6c5b42b7d49.filesusr.com/ugd/693f33_ac912a3c391e4644a4d62a60ee2de749.pdf) 

  ## Usage

  To run locally, download both Front-end and [Back-end](https://github.com/aromsa/shobu) repositiories.  After cd'ing into th Rails API directory, run:

  ```bundle install``` to install necessary gems
  ```rails db:migrate``` to create db migrations
  ```rails s``` to start the development server on Port :3000

  In the React.js front-end directory, run:

  ```npm install``` to install necessary dependencies
  ```npm start``` to start the React development server

To start a new game, enter your name and your opponent's name, check the checkbox and click "Start!".  Your own game link with show up in the browser's address bar, but you'll need to access your opponents link and explicitly message it to your opponent.  You can access your opponent's game link by clicking on the "Get Link" under your opponent's container.

To move a piece, simply click once on the piece and then click once on the destination square.  To de-select (put down) the piece, just click a second time and the move will not execute.
