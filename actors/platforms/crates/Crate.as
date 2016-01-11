package {
	import Box2D.Common.Math.b2Vec2;
	
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class Crate extends Platform {
		
		public function Crate(x:Number, y:Number, large:Boolean = false) {
			var size:int = large?2:1;
			super(x, y, size, size);
		}
		
		public function hit():void {
			var loc2Spawn:b2Vec2 = body.GetWorldCenter().Copy();
			loc2Spawn.Multiply(3 / 2);
			for (var i:int = 0; i < 25; i++) {
				var p:Particle = new Particle(loc2Spawn.x + (8 * (i % 5) - 20) / 20, loc2Spawn.y + (int(i / 5) * 8 - 20) / 20);
				p.applyImpulse(Math.random()*0.1 - 0.05, -Math.random()*0.1);
			}
			destroy();
		}
		
		override protected function createBodies():void {
			if (!bodyBuilder) {
				bodyBuilder = new StaticBodyBuilder();
				bodyBuilder.density = 1;
				bodyBuilder.friction = 0.2;
				bodyBuilder.restitution = 0.7;
				bodyBuilder.groupIndex = 2;
			}
			bodyBuilder.x = location.x;
			bodyBuilder.y = location.y;
			bodyBuilder.isSensor = false;
			body = bodyBuilder.getBody(new Array(shape));
			body.SetUserData(this);
		}
	}
}