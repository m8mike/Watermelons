package  {
	import Box2D.Dynamics.b2Body;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class Coin extends SpringBall {
		
		public function Coin(x:Number, y:Number) {
			super(x, y, 1);
		}
		
		override public function hit(playerBody:b2Body):void {
			deleted = true;
			destroy();
		}
		
		override protected function createBodies():void {
			if (!bodyBuilder) {
				bodyBuilder = new StaticBodyBuilder();
				bodyBuilder.density = 0;
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