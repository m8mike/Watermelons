package {
	import Box2D.Dynamics.b2Body;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class Funicular extends Vehicle {
		private var move:MoveAB;
		private var location1:Point;
		
		public function Funicular(x:Number, y:Number, loc1:Point) {
			super(x, y, 4, 3);
			location1 = loc1.clone();
			location1.x *= PhysicalWorld.MIN_SQARE;
			location1.y *= PhysicalWorld.MIN_SQARE;
		}
		
		override protected function init(myBody:b2Body):void {
			move = new MoveAB(location, location1, body);
			super.init(myBody);
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