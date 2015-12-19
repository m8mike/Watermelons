package {
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class StandardMoving extends Platform {
		private var move:MoveAB;
		private var rotate:Boolean;
		
		public function StandardMoving(x:Number, y:Number, loc1:Point, w:Number = 1, h:Number = 1, rotate = false) {
			super(x, y, w, h);
			loc1.x *= PhysicalWorld.MIN_SQARE;
			loc1.y *= PhysicalWorld.MIN_SQARE;
			move = new MoveAB(location, loc1, body);
			this.rotate = rotate;
		}
		
		override public function update():void {
			move.update();
			if (!rotate) {	
				body.SetAngularVelocity(0);
			}
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