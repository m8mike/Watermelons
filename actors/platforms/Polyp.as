package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Polyp extends Platform {
		private var timeToSpawnBubble:int = 100;
		
		public function Polyp(x:Number, y:Number) {
			super(x, y, 1, 1);
		}
		
		override public function update():void {
			if (timeToSpawnBubble <= 0) {
				timeToSpawnBubble = 200;
				new BubbleUpBonus(location.x / PhysicalWorld.MIN_SQARE + 0.5, location.y / PhysicalWorld.MIN_SQARE - 0.5);
			} else {
				timeToSpawnBubble--;
			}
			super.update();
		}
	}
}