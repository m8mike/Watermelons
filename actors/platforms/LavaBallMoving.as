package {
	import Box2D.Dynamics.b2Body;
	import flash.display.MovieClip;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class LavaBallMoving extends Platform {
		private var move:MoveAB;
		private var rotate:Boolean;
		private var location1:Point;
		private var radius:Number = 1;
		private var costume:MovieClip = new MovieClip();
		
		public function LavaBallMoving(x:Number, y:Number, loc1:Point, r:Number = 1, rotate:Boolean = false) {
			radius = r;
			super(x, y, 1, 1);
			location1 = loc1.clone();
			location1.x *= PhysicalWorld.MIN_SQARE;
			location1.y *= PhysicalWorld.MIN_SQARE;
			this.rotate = rotate;
		}
		
		override protected function init(myBody:b2Body):void {
			super.init(myBody);
			move = new MoveAB(location, location1, body);
			createCostume();
		}
		
		private function createCostume():void {
			costume.graphics.beginFill(0xFF0000);
			costume.graphics.drawCircle(0, 0, radius * 20);
			costume.graphics.endFill();
			CameraManager.gameLayer.addChild(costume);
		}
		
		override protected function removeCostumes():void {
			if (costume.parent) {	
				costume.parent.removeChild(costume);
			}
			super.removeCostumes();
		}
		
		override public function update():void {
			move.update();
			if (!rotate) {	
				body.SetAngularVelocity(0);
				body.m_sweep.a = 0;
			}
			if (costume && body) {	
				costume.x = body.GetWorldCenter().x * PhysicalWorld.RATIO;
				costume.y = body.GetWorldCenter().y * PhysicalWorld.RATIO;
			}
			super.update();
		}
		
		override protected function createShapes():void {
			shape = new CircleShape(PhysicalWorld.MIN_SQARE * radius);
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