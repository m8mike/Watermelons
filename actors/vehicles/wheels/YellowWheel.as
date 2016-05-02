package  {
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class YellowWheel extends Wheel {
		private var costume:MovieClip;
		public static var symbol:Class = tank_wheel;
		
		public function YellowWheel(x:Number, y:Number, radius:Number, parent:Vehicle) {
			costume = new symbol();
			costume.scaleX = 0.6;
			costume.scaleY = 0.6;
			CameraManager.gameLayer.addChild(costume);
			super(x, y, radius, parent)
		}
		
		public static function setSymbol(s:Class):void {
			symbol = s;
		}
		
		override public function update():void {
			super.update();
			if (!body) {
				return void;
				costume.visible = false;
			}
			costume.visible = true;
			costume.x = body.GetWorldCenter().x * PhysicalWorld.RATIO;
			costume.y = body.GetWorldCenter().y * PhysicalWorld.RATIO;
			costume.rotation = body.GetAngle() / Math.PI * 180 % 360;
		}
		
		override protected function cleanUpBeforeRemoving():void {
			costume.parent.removeChild(costume);
			super.cleanUpBeforeRemoving();
		}
	}
}