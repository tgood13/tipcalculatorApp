# Pre-work - Tippy

Tippy is a tip calculator application for iOS.

Submitted by: Troy Good

Time spent: ~10 hours spent in total

## User Stories

The following **required** functionality is complete:

* [X] User can enter a bill amount, choose a tip percentage, and see the tip and total values.

The following **optional** features are implemented:
* [x] Settings page to change the default tip percentage.
* [ ] UI animations
* [ ] Remembering the bill amount across app restarts (if <10mins)
* [x] Using locale-specific currency and currency thousands separators.
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [x] User can enter number of people and see the calculated tip per person value
- [x] User can use stepper to increment tip percentage and number of people
- [x] User can change default number of people on settings page

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='http://g.recordit.co/BQtpkCtPGK.gif' title='Video Walkthrough' width='326' alt='Video Walkthrough' />

GIF created with [Recordit](https://recordit.co/).

## Notes

- Current version of the app is created for iPhone 8 model

- I had one particularly troubling issue where the build would fail after deleting an outlet created by control-dragging an item from the storyboard to the view controller. I fixed this by right-clicking
the storyboard and removing the reference to the item.

- I chose to exclude UI animations because I felt they were inappropriate for the way I designed my application.

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
