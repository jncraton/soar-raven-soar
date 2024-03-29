![The AU Raven](media/raven-right.png) Soar, Raven, Soar
========================================================

[![Netlify Status](https://api.netlify.com/api/v1/badges/98c981b3-7bb6-4834-92ea-f8aea67465db/deploy-status)](https://app.netlify.com/sites/soar-raven-soar/deploys)

This game is designed to provide several activities for high school students visiting the Anderson University Computer Science department.

You can play the game here:

https://soar-raven-soar.netlify.com/

[![Game demo animation](media/demo.gif)](https://soar-raven-soar.netlify.com/)

Getting Started
===============

In order to begin making changes to this game, you'll want to download the code to your device. The simplest way to do this is do download the code as a zip file from ![here](https://github.com/jncraton/soar-raven-soar/archive/master.zip) and extract it to a directory on your desktop. If you are already familiar with Git, you may wish to simply clone this repository as you normally would.

Once you have the project on your computer, you should be able to open the file `index.html` and play the game.

If everything is working properly, you can open `index.html` in a text editor and explore the code and begin making changes.

Activities
==========

Simple Tweaks
-------------

Various properties of the game can be easily adjusted to change gameplay. For example, any of the following can be easily changed:

- Size of the paddle
- Number of bricks
- Size of bricks
- Size of the Raven hitbox
- Color of bricks and paddle

```js
const paddleHeight = 10
const paddleWidth = 75
const brickColumns = 8
const brickRows = 6
const brickWidth = 46
const brickHeight = 20
const brickPadding = 10
const brickOffsetTop = 30
const brickOffsetLeft = 20
const color = '#f57920'
const ravenHitbox = 12
```

Sprite Rotation
---------------

The raven currently always faces the same direction. This could be adjusted so that he faces his current direction of travel.

There's already a flipped version of the raven sprite included in this project named `raven-left.png`:

![Raven facing left](media/raven-left.png)

```js
function drawRaven() {
  ctx.drawImage(ravenRight, x - 38, y - 12)
}
```

Clipping
--------

We currently allow very high difficulty values to be set. This breaks gameplay by allowing the Raven to "clip" through objects. Here's one example:

- Set the difficulty to 1000
- Notice that your score now climbs rapidly. This is due to the fact that our basic physics engine was only designed to handle velocities up to a certain limit.
- Try setting the difficulty to 20, pausing the game, and stepping through individual frames to get a better idea of what is happening.

These sorts of clipping bugs are common in many games, include Super Mario 64:

![Lobby Backwards Long Jump from Super Mario 64](https://s.aolcdn.com/hss/storage/midas/31b8713d4852b240c1b0a550db8ef165/205791583/BLJ.gif)

We should limit difficulty to reasonable values to prevent this behavior.

Security
--------

The value of the difficulty field is currently used in an unsafe way that can allow cheating. The following is one example of this unintended behavior:

- Pause the game
- Enter `ravensFreed=1000` in the difficulty field
- Press `Restart`
- Enter `3` for the difficulty
- Press `Restart`
- Unpause the game
- Note how your score has changed

We should change the way this field is handled to make it more secure.

```js
let difficulty = eval(document.querySelector('input[name=difficulty]').value)
```

Continuous Deployment
---------------------

This application can be forked and configured to build and deploy onto arbitrary hosting environments. We can set that up using Github and Netlify.

1. Create a Github account.
2. Navigate to this repository and press `Fork`.
3. Browse to netlify.com and click "Sign up". Sign up using GitHub.
4. Create a new site from Git and set the appropriate build options.
5. Wait for the deployment to complete and view your live site.

Now that you have CD configured, any changes that you push to your GitHub repository will be deployed in moments to a global content delivery network.

Creating a Bot
--------------

You could use the developer console (opened with Ctrl+Shift+I) to write a bot to play the game for you. One easy way to do this would be to create a function that sets the paddle position to the position of the raven and call it regularly.

Hint: You may want to take a look at [setInterval](https://developer.mozilla.org/en-US/docs/Web/API/WindowOrWorkerGlobalScope/setInterval).

Learn More
==========

The inner workings of this application are based around the JavaScript [breakout game tutorial](https://developer.mozilla.org/en-US/docs/Games/Tutorials/2D_Breakout_game_pure_JavaScript) available from Mozilla. Walking through that tutorial step by step will give you a stronger sense for how this game functions.

There are also several other [web game development tutorials](https://developer.mozilla.org/en-US/docs/Games/Tutorials) available from Mozilla if you are ready to go deeper.
