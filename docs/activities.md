Sprite Rotation
===============

The Raven currently always faces the same direction. This should be adjusted so that he faces his current direction of travel.

Difficulty Security
===================

The value of the difficulty field is currently used in an unsafe way that can allow cheating. The following is one example of this unintended behavior:

- Pause the game
- Enter `ravens_freed=1000` in the difficulty field
- Press `Restart`
- Enter `3` for the difficulty
- Press `Restart`
- Unpause the game
- Note how your score has changed

We should change the way this field is handled to make it more secure.

Difficulty Threshold
====================

We currently allow very high difficulty values to be set. This breaks gameplay. Here's one example:

- Set the difficulty to 1000
- Notice that your score now climbs rapidly. This is due to the fact that our basic physics engine was only designed to handle velocities up to a certain limit.

We should limit difficulty to reasonable values.
