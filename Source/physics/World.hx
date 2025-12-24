// Handle the dynamics between bodies

package physics;

class World {
    public var bodies:Array<Body>;

    public function new() {
        bodies = [];
    }

    public function addBody(body:Body):Void {
        bodies.push(body);
    }

    // Move forward by one frame
    public function step(dt:Float, xBound:Float, yBound:Float):Void {
        for (body in bodies) {
            // Check for boundary collisions
            if (body.x <= 0)    body.vx = -body.vx;
            if (body.x + body.w >= xBound)    body.vx = -body.vx;
            if (body.y <= 0)    body.vy = -body.vy;
            if (body.y + body.h >= yBound)   body.vy = -body.vy;
            
            // Update body position by one frame based on velocity
            body.x += body.vx * dt;
            body.y += body.vy * dt;
        }
    }
}