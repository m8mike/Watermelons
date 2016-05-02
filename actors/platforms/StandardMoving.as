package {
	import Box2D.Dynamics.b2Body;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class StandardMoving extends Platform {
		protected var move:MoveAB;
		protected var rotate:Boolean;
		protected var location1:Point;
		
		public function StandardMoving(x:Number, y:Number, loc1:Point, w:Number = 1, h:Number = 1, rotate:Boolean = false) {
			super(x, y, w, h);
			location1 = loc1.clone();
			location1.x *= PhysicalWorld.MIN_SQARE;
			location1.y *= PhysicalWorld.MIN_SQARE;
			this.rotate = rotate;
		}
		
		override protected function init(myBody:b2Body):void {
			super.init(myBody);
			move = new MoveAB(location, location1, body);
		}
		
		override public function update():void {
			move.update();
			if (!rotate) {	
				body.SetAngularVelocity(0);
				body.m_sweep.a = 0;
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