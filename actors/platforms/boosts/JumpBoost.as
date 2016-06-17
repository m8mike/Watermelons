package {
	import Box2D.Dynamics.b2Body;
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class JumpBoost extends Boost {
		private var costume:MovieClip = new MovieClip();
		
		public function JumpBoost(x:Number, y:Number) {
			super(x, y);
		}
		
		override protected function init(myBody:b2Body):void {
			super.init(myBody);
			createCostume();
		}
		
		override public function update():void {
			if (costume && body) {	
				costume.x = body.GetWorldCenter().x * PhysicalWorld.RATIO;
				costume.y = body.GetWorldCenter().y * PhysicalWorld.RATIO;
				costume.rotation = body.GetAngle() / Math.PI * 180;
			}
			super.update();
		}
		
		override public function hit(bodyHit:b2Body):void {
			var vehicle:Vehicle = bodyHit.GetUserData();
			vehicle.jump.jump();
		}
		
		private function createCostume():void {
			costume.graphics.beginFill(0xFF8000);
			costume.graphics.drawRect(0, 0, 3 * 20, 3 * 20);
			costume.graphics.endFill();
			CameraManager.gameLayer.addChildAt(costume, 0);
		}
		
		override protected function removeCostumes():void {
			if (costume.parent) {	
				costume.parent.removeChild(costume);
			}
			super.removeCostumes();
		}
	}
}