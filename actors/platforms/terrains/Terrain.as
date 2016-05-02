package {
	import flash.display.MovieClip;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class Terrain {
		protected var costume:MovieClip = new MovieClip();
		public var finishPoint:Point;
		
		public function Terrain(location:Point, amount:int) {
			CameraManager.gameLayer.addChild(costume);
		}
		
		protected function addPlatformCostume(x:Number, y:Number, w:Number, h:Number, angle:Number = 0):void {
			var platformCostume:MovieClip = new MovieClip();
			var color:uint = parseInt("0x" + ((1 << 24) * Math.random() | 0).toString(16));
			platformCostume.graphics.beginFill(color);
			platformCostume.graphics.drawRect(0, 0, w * 20, h * 20);
			platformCostume.graphics.endFill();
			platformCostume.rotation = angle;
			platformCostume.x = x * 20;
			platformCostume.y = y * 20;
			costume.addChild(platformCostume);
		}
	}
}