package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class Boost extends Platform {
		private var impulse:b2Vec2 = new b2Vec2(10, 0);
		public var activated:Boolean = false;
		
		public function Boost(x:Number, y:Number, w:Number = 3, h:Number = 3, impulse:b2Vec2 = null) {
			if (impulse) {
				this.impulse = impulse.Copy();
			}
			super(x, y, w, h);
		}
		
		override public function hit(bodyHit:b2Body):void {
			if (!(bodyHit.GetUserData() is Vehicle)) {
				return void;
			}
			var vehicle:Vehicle = bodyHit.GetUserData();
			if (!activated) {
				vehicle.body.ApplyImpulse(impulse, vehicle.body.GetWorldCenter().Copy());
				activated = true;
			}
		}
		
		override protected function createBodies():void {
			if (!bodyBuilder) {
				bodyBuilder = new StaticBodyBuilder();
				bodyBuilder.density = 0;
				bodyBuilder.friction = 0.2;
				bodyBuilder.restitution = 0.7;
				bodyBuilder.groupIndex = -2;
			}
			bodyBuilder.x = location.x;
			bodyBuilder.y = location.y;
			bodyBuilder.isSensor = true;
			body = bodyBuilder.getBody(new Array(shape));
			body.SetUserData(this);
		}
	}

}