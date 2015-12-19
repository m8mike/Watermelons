package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	
	/**
	* move from angle1 to angle2 and backwards
	* @author Mad Mike
	*/
	public class FlyControl extends Behavior {
		public var upVec:b2Vec2;
		public var downVec:b2Vec2;
		public var leftVec:b2Vec2;
		public var rightVec:b2Vec2;
		public var maxSpeedUp:Number = 2;
		public var maxSpeedSide:Number = 2;
		
		public function FlyControl(body:b2Body) {
			upVec = new b2Vec2(0, -50);
			downVec = new b2Vec2(0, 2);
			leftVec = new b2Vec2(-30, 0);
			rightVec = new b2Vec2(30, 0);
			super(body);
		}
		
		override public function update():void {
			var vel:b2Vec2 = body.GetLinearVelocity().Copy();
			if (Controls.left) {
				if (vel.x > -maxSpeedSide) {
					body.ApplyForce(leftVec, body.GetWorldCenter().Copy());
				}
			}
			if (Controls.right) {
				if (vel.x < maxSpeedSide) {
					body.ApplyForce(rightVec, body.GetWorldCenter().Copy());
				}
			}
			if (Controls.up) {
				if (vel.y > -maxSpeedUp) {
					body.ApplyForce(upVec, body.GetWorldCenter().Copy());
				}
			}
			if (Controls.down) {
				if (vel.y < maxSpeedUp) {
					body.ApplyForce(downVec, body.GetWorldCenter().Copy());
				}
			}
			super.update();
		}
	}
}