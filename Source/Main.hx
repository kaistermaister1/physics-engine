// Main.hx contains the main class that adds to the display tree, which is rendered to the screen by OpenFL
// Main listens for user events, call different parts of the simulation, plot results, etc.

// Body() is a class that stores the mathematical properties/numbers (coordinates, velocities, etc) of the objects
// Shape() is an OpenFL class that allows for drawing shapes onto the screen
// We store both instances of these classes as pairs in an array called "entities" in Main().

package;

import openfl.display.Sprite;
import openfl.display.Shape;
import openfl.events.Event;
import physics.Body;
import physics.World;
import openfl.Lib;

// Class to store the body/object pairs in Main
class Entity {
    public var body:Body;
    public var shape:Shape;

    public function new(body:Body, shape:Shape) {
        this.body = body;
        this.shape = shape;
    }
}

// Create new class that inherits from OpenFL's Sprite class, can draw objects to screen
class Main extends Sprite {
    var entities:Array<Entity> = [];
    var world:World;
    var lastTimeMs:Int;

    public function new() {
        super();

        // Create a world class which handles physics
        world = new World();

        // Timer to account for fluctuating framerate
        lastTimeMs = Lib.getTimer();
        
        // When OpenFL fires ENTER_FRAME (happens every frame, depending on FPS in project.xml, call the onFrame function
        addEventListener(Event.ENTER_FRAME, onFrame);

        // Create shapes
        createEntity(250, 250, 100, 100, 0xFF0000, 120, 120);
        createEntity(350, 350, 100, 100, 0xFF0000, -120, 120);

    }

    // Updates the rectangle's location based on velocity. OpenFL passes the event object from addEventListener to onFrame
    public function onFrame(e:Event):Void {
        var now = Lib.getTimer();
        var dt:Float = (now - lastTimeMs) / 1000.0;
        lastTimeMs = now;
        if (dt > 1/15) dt = 1/15;
        world.step(dt, stage.stageWidth, stage.stageHeight);

        // Math objects were updated, now update the shapes
        for (ent in entities) {
            ent.shape.x = ent.body.x;
            ent.shape.y = ent.body.y;
        }
    }

    // Body creator helper function. Creates a Body() and Shape() object with proper attributes, and adds the Shape() to the display tree
    public function createEntity(x:Float, y:Float, h:Float, w:Float, color:Int, vx:Float=0, vy:Float=0):Void {
        var body = new Body(x, y, h, w, color);
        body.vx = vx;
        body.vy = vy;

        var shape = new Shape();
        shape.graphics.beginFill(color);
        shape.graphics.drawRect(0, 0, w, h);
        shape.graphics.endFill();
        shape.x = body.x;
        shape.y = body.y;
        addChild(shape); // Add Shape() to the display tree using the built in function addChild()

        world.addBody(body);
        entities.push(new Entity(body, shape));
    }
}