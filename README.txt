This is a physics engine coded in Haxe, which is close to C++.

To run the code, Haxe uses OpenFL - a library with built in classes and functionality to display objects in a window (what the user sees)
    - OpenFL renders the 'display tree' to the screen every frame.
    - The display tree is a parent/child type structure of objects (objects are instances of classes in C++)
    - The root node of the display tree is called 'stage'. Its first child in Main(), which we make in Main.hx 
    - Main() has object children, like Shape(), which are stored as attributes. As the attributes of the Shape() objects, like position or velocity, change over time, OpenFL continues to render the entire display tree every frame

Project overview:
- Assets/ and Export/ are files that were automatically created and I haven't touched
- project.xml specifies the background color, framerate, etc. of the physics engine
- Main.hx, Source/physics/Body.hx, and Source/physics/World.hx were created by me 

To avoid confusion, I'll refer to objects in the physics engine as 'bodies', since objects are technically a general C++ term for instances of a class.

Body.hx
    - Every body in the physics engine is an instance of two C++ classes: Body() and Shape()
    - This file defines the Body() class, which holds the mathematical information for an object in the simulation. 
    - When a body moves, for example, it means the corresponding x and y attributes of the Body() object update.

World.hx 
    - This file defines the 'physics' of our simulation; how bodies should behave when interacting with things like walls, other bodies, etc.

Main.hx
    - This is the main file where we create bodies, call World.hx for interaction rules, and render bodies to the screen
    - Each body in the physics simulation is an instance of Body() and Shape(); these are made in Main.hx
    - Shape() is a built in class from OpenFL (Haxe provides that) that allows bodies to be rendered to the screen.
    - Thus, we store the information about bodies in Body(), and pass that information to Shape() to be rendered.
    - Whenever an instance of Body() is updated, we must also update Shape() so its rendered correctly.

That's about it so far! 12/24/25. As of now, I've created Body() to be a basic box, programmed wall collisions in World.hx, and added a timer in Main.hx to account for nonconstant framerate when the display tree is updated.
We can keep updating our knowledge in this file. :)