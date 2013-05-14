# AirturnPedalInput
The Airturn BT-105 Bluetooth Page Turner can be used for hands-free triggering of events in iOS. It functions as a Bluetooth keyboard, triggering *up* and *down* keyboard events when the *left* and *right* pedals are pressed.

# Usage:
Setting up the AirturnPedalDriver is simple:
- Drag the AirturnPedalDriver.h/.m files into your project.
- Create an instance of the AirturnPedalDriver in the view controller you want to receive pedal events from.
- Call startMonitoring when you want your view controller to start receiving pedal events, and stopMonitoring to block pedal events.
- Implement the didReceiveInput: delegate method to handle events from the pedal.
- Done!
Check out the sample project for details.

# Credits
AirturnPedalInput was created by [Liam Dunne](https://twitter.com/liamdunne). The code is based on ArendJanKramer's [Airturn-driver](https://github.com/ArendJanKramer/Airturn-driver), but simplified to make it easier to start & stop monitoring of BT-105 events.

# Contact
Follow me on Twitter at [@liamdunne](https://twitter.com/liamdunne)

# License
AirturnPedalInput is available under the MIT license. Check out LICENSE for details.
