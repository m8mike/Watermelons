package { 
	import Box2D.Dynamics.b2Body;
	import flash.display.MovieClip;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class StandardUnfixedMoving extends StandardMoving {
		private var costume:MovieClip = new MovieClip();
		
		public function StandardUnfixedMoving(x:Number, y:Number, loc1:Point, w:Number = 1, h:Number = 1, rotate:Boolean = false) {
			super(x, y, loc1, w, h, rotate);
		}
		
		override protected function init(myBody:b2Body):void {
			super.init(myBody);
			createCostume();
		}
		
		override public function update():void {
			move.update();
			if (!rotate) {
				body.SetAngularVelocity(0);
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
	}
}