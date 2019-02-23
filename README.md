![Dialog System](http://thecode.cafe/assets/img/dialog-system-banner.png)

## GameMaker Studio 2 Version

This project is known to work in GameMaker Studio 2 IDE v2.2.1.375 with Runtime v2.2.1.287 as of February 23, 2019.  
The scripts in this system will work in all versions of GameMaker Studio 2.  

### Links

Website: http://thecode.cafe/posts/dialog-system.  
Marketplace: https://marketplace.yoyogames.com/assets/7990/dialog-system-2d.

## Branching Dialog System for GameMaker Studio 2

I found an old project I created in late 2015 to test GameMaker Studio 2 in the still early days of development.
The project casually grew in complexity as I used it to test an expanding set of functionality, like tile sets and the Drag and Drop visual scripting.
It has a lot of good and popular gameplay systems that were allowed to slowly mature over time so I checked if I could dissect a few, and the first of these gameplay systems is a very easy-to-use branching dialog system.  

This is not a difficult system to write by any means and a lot of them - good, free ones - already exist for GameMaker Studio 2, but I figured that since I had it lying around I may as well clean it up and release it to the world - totally
free and under the [MIT License](http://thecode.cafe/assets/files/mit_license.txt) as usual.  

![Dialog System](http://thecode.cafe/assets/gif/dialog-system.gif)

The best thing about this system is just how easy it is to use and set up complex branching dialogs with, and that it focuses purely on making branching dialogs easy to implement rather than dictate how to display them in your game.
The image below shows all the code you need to integrate the dialog system into your code - and half of the code in this image is only for the demo.   

![Dialog System](http://thecode.cafe/assets/img/dialog-system-code.png)

It has support for things like inserting string arguments from variables, and even inserting variables directly via string expansion. This allows you to write a dialog string like "no one has as many friends as the man with many ${item_name}!" and the "${item_name}" part will automatically be expanded to the value of the "item_name" variable on the calling object.
It comes with a demo (see gif above) that shows how to use it to create dialogs (see image below), and everything works out of the box with no setup required.  

![Dialog System](http://thecode.cafe/assets/img/dialog-system-setup.png)

### Documentation

I believe the code base is sufficiently small and thoroughly documented and with the addition of the included demo, I don't feel further documentation is required.
For example, the dialog system contains only 1 object: obj_dialog.