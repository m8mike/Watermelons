package {
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class Funicular extends Vehicle {
		private var move:MoveAB;
		
		public function Funicular(x:Number, y:Number, loc1:Point) {
			super(x, y, 4, 3);
			loc1.x *= PhysicalWorld.MIN_SQARE;
			loc1.y *= PhysicalWorld.MIN_SQARE;
			move = new MoveAB(location, loc1, body);
		}
		
		override public function update():void {
			move.update();
			super.update();
		}
		
		override protected function createBodies():void {
			if (!bodyBuilder) {
				bodyBuilder = new StaticBodyBuilder();
				bodyBuilder.density = 1;
				bodyBuilder.friction = 0.2;
				bodyBuilder.restitution = 0;
				bodyBuilder.groupIndex = -2;
			}
			bodyBuilder.x = location.x;
			bodyBuilder.y = location.y;
			body = bodyBuilder.getBody(new Array(shape));
			body.SetUserData(this);
		}
	}
}