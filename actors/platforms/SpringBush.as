package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	
	/**
	 * ...
	 * @author ...
	 */
	public class SpringBush extends Platform {
		
		public function SpringBush(x:Number, y:Number) {
			super(x, y, 1, 1);
		}
		
		public function hit(playerBody:b2Body):void {
			var angle:Number = body.GetAngle(); 
			var x:Number = 0.3 * Math.sin(angle);
			var y:Number = -0.3 * Math.cos(angle);
			playerBody.ApplyImpulse(new b2Vec2(x, y), playerBody.GetWorldCenter().Copy());
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