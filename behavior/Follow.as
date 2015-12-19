package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Follow extends Behavior {
		private var bodyToFollow:b2Body;
		
		public function Follow(body:b2Body, bodyToFollow:b2Body) {
			this.bodyToFollow = bodyToFollow;
			super(body);
		}
		
		override public function update():void {
			var vel:b2Vec2 = new b2Vec2();
			body.SetLinearVelocity(vel);
		}
	}
}