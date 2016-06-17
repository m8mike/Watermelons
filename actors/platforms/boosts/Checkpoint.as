package  {
	import Box2D.Dynamics.b2Body;
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class Checkpoint extends Boost {
		private var costume:MovieClip = new MovieClip();
		
		public function Checkpoint(x:Number, y:Number) {
			super(x, y, 3, 12);
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
			LevelDirector.currentLevel.onCheckpoint();
			LevelDirector.currentLevel.setLastCheckpointLoc(location.x, location.y);
		}
		
		private function createCostume():void {
			costume.graphics.beginFill(0xFF8000);
			costume.graphics.drawRect(0, 0, width * 20, height * 20);
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