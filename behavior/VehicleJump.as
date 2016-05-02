package  {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class VehicleJump extends Behavior {
		private var jumpForce:Number = 30;//min 30//60
		private var condition:Condition;
		private var counterBetweenJumps:int = 0;
		
		private var canUseNitro:Boolean = false;
		private var nitroUsed:Boolean = false;
		private var boostApplied:Boolean = false;
		
		public function VehicleJump(condition:Condition, body:b2Body) {
			this.condition = condition;
			super(body);
		}
		
		override public function update():void {
			if (counterBetweenJumps > 0) {
				counterBetweenJumps--;
			}
			if (!Controls.vehicleJump && !nitroUsed && !condition.canJump) {
				canUseNitro = true;
			}
		}
		
		public function boostJump():void {
			if (!boostApplied) {
				applyImpulse();
				boostApplied = true;
			} else if (condition.canJump) {
				boostApplied = false;
			}
		}
		
		public function jump():void {
			if (!condition.canJump) {
				if (canUseNitro) {
					nitroUsed = true;
					canUseNitro = false;
					applyNitro();
				}
				return void;
			}
			canUseNitro = false;
			nitroUsed = false;
			/*if (Math.abs(body.GetLinearVelocity().Length()) > 10) {
				return void;
			}*/
			if (counterBetweenJumps > 0) {
				return void;
			}
			counterBetweenJumps = 10;
			applyImpulse1();
		}
		
		private function applyImpulse():void {
			var angle:Number = body.GetAngle() - Math.PI / 2;
				body.ApplyImpulse(new b2Vec2(Math.cos(angle) * jumpForce, Math.sin(angle) * jumpForce), 
									body.GetWorldCenter().Copy());
		}
		
		private function applyImpulse1():void {
			var veh:CarBuilder = body.GetUserData();
			var center:b2Vec2 = body.GetWorldCenter().Copy();
			var angle:Number =  - Math.PI / 2;
				body.ApplyImpulse(new b2Vec2(Math.cos(angle) * jumpForce, Math.sin(angle) * jumpForce), center);
			body.SetAngularVelocity(5);
			for each (var wheel:Wheel in veh.wheels) {
				var wheelCenter:b2Vec2 = wheel.body.GetWorldCenter().Copy();
				wheel.body.ApplyImpulse(new b2Vec2(Math.cos(angle) * 10, Math.sin(angle) * 10), wheelCenter);
			}
		}
		
		private function applyNitro():void {
			var veh:CarBuilder = body.GetUserData();
			var center:b2Vec2 = body.GetWorldCenter().Copy();
			var angle:Number =  body.GetAngle();
				body.ApplyImpulse(new b2Vec2(Math.cos(angle) * jumpForce/2, Math.sin(angle) * jumpForce/2), center);
			for each (var wheel:Wheel in veh.wheels) {
				var wheelCenter:b2Vec2 = wheel.body.GetWorldCenter().Copy();
				wheel.body.ApplyImpulse(new b2Vec2(Math.cos(angle) * 5, Math.sin(angle) * 5), wheelCenter);
			}
		}
	}
}