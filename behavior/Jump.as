package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Jump extends Behavior {
		private var period:int;
		private var power:int = 0;
		public var timeToJump:int;
		
		private static var canWallJump:Boolean = false;
		
		private var condition:Condition;
		
		private static const JUMP_TIME:int = 1;
		public var jumpIterations:int = 0;
		public var jumpTimeLeft:int = 0;
		public var impulseReducer:int = 0;
		
		private var JUMP_IMPULSE:b2Vec2 = new b2Vec2(0.0, -0.3);
		private static const JUMP_FORCE:b2Vec2 = new b2Vec2(0.0, -3.0);
		private static const LEFT_WALL_IMPULSE:b2Vec2 = new b2Vec2(-0.5 / 1.5, -0.6 / 1.5);
		private static const RIGHT_WALL_IMPULSE:b2Vec2 = new b2Vec2(0.5 / 1.5, -0.6 / 1.5);
		
		public function Jump(condition:Condition, body:b2Body, impulse:b2Vec2 = null) {
			this.condition = condition;
			super(body);
			if (impulse != null) {
				JUMP_IMPULSE = impulse;
			}
		}
		
		public function stopJumping():void {
			power = 0;
		}
		
		public function dispatchAutomatedJump(period:int, power:Number):void {
			this.period = period;
			this.power = power;
			timeToJump = 0;
		}
		
		private function automatedJump():void {
			if (timeToJump > 0) {
				timeToJump--;
			} else {
				timeToJump = period;
				body.ApplyImpulse(new b2Vec2(0, -power), body.GetWorldCenter());
			}	
		}
		
		override public function update():void {
			reduceJumpTime();
			if (power) {
				automatedJump();
			}
			super.update();
		}
		
		public function reduceJumpTime():void {
			jumpTimeLeft -= 5;
			if (jumpTimeLeft < 0) {
				jumpTimeLeft = 0;
			}
		}
		
		public function dontJump():void {
			if (jumpTimeLeft) {
				jumpTimeLeft = 0;
			}
			if (impulseReducer > 0) {
				impulseReducer = 0;
			}
		}
		
		public function jump():void {
			//trace(canJump);
			var canJump:Boolean = condition.canJump;
			if (canJump) {
				SoundMusic.playJump();
				shortJump();
				jumpIterations = 7;
			} else if (jumpIterations > 0) {
				longJump();
				jumpIterations--;
			} else {
				jumpIterations = 0;
			}
			canWallJump = true;
			wallJumps();
		}
		
		public function wallJumps():void {
			if (canWallJump) {
				canWallJump = false;
			} else {
				return void;
			}
			if (body.GetLinearVelocity().y > 1.2 && !condition.onSticky) {
				return void;
			}
			var canJump:Boolean = condition.canJump;
			var leftWallJump:Boolean = condition.leftWallJump;
			var rightWallJump:Boolean = condition.rightWallJump;
			if (leftWallJump && !canJump && jumpIterations < 3) {
				var lwi:b2Vec2 = LEFT_WALL_IMPULSE.Copy();
				lwi.Multiply(15);
				body.SetLinearVelocity(lwi);
			} else if (rightWallJump && !canJump && jumpIterations < 3) {
				var rwi:b2Vec2 = RIGHT_WALL_IMPULSE.Copy();
				rwi.Multiply(15);
				body.SetLinearVelocity(rwi);
			}
			condition.rightWallJump = false;
			condition.leftWallJump = false;
		}
		
		private function shortJump():void {
			body.ApplyImpulse(JUMP_IMPULSE, body.GetWorldCenter());
			jumpTimeLeft = JUMP_TIME;
			impulseReducer = 0;
		}
		
		private function longJump():void {
			if (impulseReducer < 0) {
				impulseReducer = 0;
			}
			var jumpForceReduced:b2Vec2 = new b2Vec2(JUMP_FORCE.x, JUMP_FORCE.y + 0.3 * impulseReducer);
			body.ApplyForce(jumpForceReduced, body.GetWorldCenter());
			impulseReducer++;
		}
	}
}