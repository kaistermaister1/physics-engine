// Represent one object in the physics simulation as numbers

package physics;

class Body {
    // Store x and y position/velocity, width and height boxes, and color
    public var x:Float;
    public var y:Float;
    public var vx:Float;
    public var vy:Float;

    public var h:Float;
    public var w:Float;

    public var color:Int;

    public function new(x: Float, y: Float, h: Float, w: Float, color: Int) {
        this.x = x;
        this.y = y;
        this.h = h;
        this.w = w;
        this.color = color;

        // Default to zero velocity
        this.vx = 0;
        this.vy = 0;
    }
}