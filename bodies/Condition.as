package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class Condition {
		public var falling:Boolean = false;
		public var sleeping:Boolean = false;
		public var directionRight:Boolean = true;
		public var stopped:Boolean = false;
		
		public var inCloud:Boolean = false;
		public var inFan:Boolean = false;
		
		public var canJump:Boolean = false;
		public var leftWallJump:Boolean = false;
		public var rightWallJump:Boolean = false;
		public var wallJumped:Boolean = false;
		public var onSticky:Boolean = false;
		private var cloudJumping:Boolean = false;
		
		/*
		 * wallSlide
		 * speedFall
		 * sleep
		 *  deal with it
		 *  hat trick
		 * onEdge
		 * 
		 * run
		 * brake
		 * inCloud
		 * inFan
		*/
		public function Condition() {
		
		}
		
		public function allowJumps(x:Number, y:Number):void {
			if (x > -0.72 && x < 0.72 && y < 0) {
				//trace(leftWallJump + " " + rightWallJump);
				if (!leftWallJump && !rightWallJump) {
					canJump = true;
				}
			}
			allowWallJumps(x, y);
		}
		
		public function allowWallJumps(x:Number, y:Number):void {
			if (y < -0.72 || y > 0.72) {
				return void;
			}
			if (x < 0) {
				leftWallJump = true;
				wallJumped = true;
			} else if (x > 0) {
				rightWallJump = true;
				wallJumped = true;
			}
		}
		
		public function disallowJumps():void {
			canJump = false;
			rightWallJump = false;
			leftWallJump = false;
		}
		
		public function update(body:b2Body):void {
			var vel:b2Vec2 = body.GetLinearVelocity();
			sleeping = body.IsSleeping();
			directionRight = vel.x > 0;
			stopped = vel.x == 0;
			falling = vel.y > 0 && !canJump;
			wallJumped = rightWallJump || leftWallJump || wallJumped;
		}
	}
}