package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class FerrisWheel extends Actor {
		private var spheres:Array = [];
		private var numSpheres:int = 16;
		private var particleDistance:int = 200;
		private var centerRadius:Number = 15/20;
		private var sphereRadius:Number = 1;
		private var centralJoints:Array = [];
		private var centralCircle:SpringBall;
		
		public function FerrisWheel(x:Number, y:Number, radius:Number) {
			centerRadius = radius;
			centralCircle = new SpringBall(x, y);
			centralCircle.show();
			var body:b2Body = centralCircle.getBody();
			for (var i:int = 0; i < numSpheres; i++) {
				var angle:Number = (2 * Math.PI) / numSpheres * i;
				var posX:Number = particleDistance * Math.cos(angle) / PhysicalWorld.RATIO + x;
				var posY:Number = particleDistance * Math.sin(angle) / PhysicalWorld.RATIO + y;
				spheres.push(new SimpleRect(posX, posY, 3, sphereRadius, centralCircle, angle));
			}
			/*for (i = 1; i < spheres.length; i++) {
				Joints.createDistanceJoint(spheres[i].body, spheres[i-1].body);
				centralJoints.push(Joints.createDistanceJoint(spheres[i].body, body));
			}
			Joints.createDistanceJoint(spheres[0].body, spheres[spheres.length - 1].body);
			centralJoints.push(Joints.createDistanceJoint(spheres[0].body, body));*/
			location = new Point(x * PhysicalWorld.MIN_SQARE, y * PhysicalWorld.MIN_SQARE);
			super(location);
		}
		
		override public function update():void {
			for each (var circle:SimpleRect in spheres) {
				circle.currentAnglePos += Math.PI / 180;
				var pos:b2Vec2 = new b2Vec2();
				pos.x = particleDistance * Math.cos(circle.currentAnglePos) + centralCircle.location.x - 1.5*20;
				pos.y = particleDistance * Math.sin(circle.currentAnglePos) + centralCircle.location.y - 0.5*20;
				pos.Multiply(1 / 30);
				circle.body.SetXForm(pos, 0);
				/*var impulse:b2Vec2 = circle.body.GetWorldCenter().Copy();
				impulse.x -= centralCircle.getBody().GetWorldCenter().x;
				impulse.y -= centralCircle.getBody().GetWorldCenter().y;
				var angle:Number = Math.atan2(impulse.y, impulse.x) - Math.PI/2;
				impulse.x = 1.3 * Math.cos(angle);
				impulse.y = 1.3 * Math.sin(angle);
				var newLoc:b2Vec2 = circle.body.GetWorldCenter().Copy();
				newLoc.x += impulse.x;
				newLoc.y += impulse.y;
				var center:b2Vec2 = circle.body.GetWorldCenter().Copy();
				center.x -= 1.5*20;
				center.y -= 0.5*20;
				circle.body.SetXForm(center, 0);
				circle.body.SetLinearVelocity(impulse);*/
				//circle.body.SetLinearVelocity(new b2Vec2());
				//circle.body.SetXForm(newLoc, 0);
				//circle.body.m_sweep.a = 0;
			}
			super.update();
		}
	}
}