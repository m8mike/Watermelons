package {
	import Box2D.Common.Math.b2Vec2;
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class Tank extends CarBuilder {
		private var costume:MovieClip;
		public static var symbol:Class = tank_body;
		
		public function Tank(x:Number, y:Number) {
			costume = new symbol();
			costume.scaleX = 0.6;
			costume.scaleY = 0.6;
			CameraManager.gameLayer.addChild(costume);
			super(x, y, 3, 2);
			spawnOffset.x = width / 2 * PhysicalWorld.MIN_SQARE;
			spawnOffset.y = -height / 2 * PhysicalWorld.MIN_SQARE;
		}
		
		public static function setSymbol(s:Class):void {
			symbol = s;
		}
		
		override protected function addWheels():void {
			var x:Number = location.x / PhysicalWorld.MIN_SQARE;
			var y:Number = location.y / PhysicalWorld.MIN_SQARE;
			wheels.push(new YellowWheel(x - 1, y + 2, 1, this));
			wheels.push(new YellowWheel(x, y + 3, 1, this));
			wheels.push(new YellowWheel(x + 1, y + 3, 1, this));
			wheels.push(new YellowWheel(x + 2, y + 3, 1, this));
			wheels.push(new YellowWheel(x + 3, y + 3, 1, this));
			wheels.push(new YellowWheel(x + 4, y + 2, 1, this));
		}
		
		override public function update():void {
			super.update();
			if (!body) {
				costume.visible = false;
				return void;
			}
			costume.visible = true;
			costume.x = body.GetWorldCenter().x * PhysicalWorld.RATIO;
			costume.y = body.GetWorldCenter().y * PhysicalWorld.RATIO;
			costume.rotation = body.GetAngle() / Math.PI * 180;
			for each (var wheel:Wheel in wheels) {
				wheel.update();
			}
		}
		
		override protected function cleanUpBeforeRemoving():void {
			costume.parent.removeChild(costume);
			super.cleanUpBeforeRemoving();
		}
	}
}