package {
	import Box2D.Dynamics.b2Body;
	import flash.display.MovieClip;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class StandardMoving extends Platform {
		protected var move:MoveAB;
		protected var rotate:Boolean;
		protected var location1:Point;
		private var costume:MovieClip = new MovieClip();
		
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
			createCostume();
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
				costume.rotation = body.GetAngle() / Math.PI * 180;
			}
			super.update();
		}
		
		private function createCostume():void {
			costume.graphics.beginFill(0xFF0000);
			costume.graphics.drawRect(-width * 10, -height * 10, width * 20, height * 20);
			costume.graphics.endFill();
			CameraManager.gameLayer.addChild(costume);
		}
		
		override protected function removeCostumes():void {
			if (costume.parent) {	
				costume.parent.removeChild(costume);
			}
			super.removeCostumes();
		}
		
		override protected function createBodies():void {
			if (!bodyBuilder) {
				bodyBuilder = new StaticBodyBuilder();
				bodyBuilder.density = 1;
				bodyBuilder.friction = 0.6;
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