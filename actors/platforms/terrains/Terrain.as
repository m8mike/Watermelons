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
		
		protected function addPlatformCostume1(x:Number, y:Number, w:Number, h:Number, angle:Number = 0):void {
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
		
		protected function addSpikesCostume(x:Number, y:Number, w:Number, h:Number, angle:Number = 0):void {
			var platformCostume:MovieClip = new MovieClip();
			platformCostume.graphics.beginFill(0xC0C0C0);
			platformCostume.graphics.lineStyle(5, 0x000000);
			platformCostume.graphics.moveTo(0, 25);
			for (var i:int = 0; i < w*2; i++) {
				platformCostume.graphics.lineTo(i * 10, 25 * (i % 2));
			}
			platformCostume.graphics.lineTo(w * 20, 0);
			platformCostume.graphics.lineTo(w * 20, 40);
			platformCostume.graphics.lineTo(0, 40);
			platformCostume.graphics.endFill();
			platformCostume.rotation = angle;
			platformCostume.x = x * 20;
			platformCostume.y = y * 20;
			costume.addChild(platformCostume);
		}
		
		protected function addPlatformCostume(x:Number, y:Number, w:Number, h:Number, angle:Number = 0):void {
			var platformCostume:MovieClip = new MovieClip();
			platformCostume.graphics.beginFill(0xAC0B0B);
			platformCostume.graphics.drawRect(0, 0, w * 20, h * 20);
			platformCostume.graphics.endFill();
			platformCostume.graphics.beginFill(0x707070);
			platformCostume.graphics.drawRect(0, -20, w * 20, 30);
			platformCostume.graphics.endFill();
			platformCostume.graphics.beginFill(0x000000);
			platformCostume.graphics.drawRect(0, 10, w * 20, 10);
			platformCostume.graphics.endFill();
			platformCostume.graphics.beginFill(0x4B0505);
			platformCostume.graphics.drawRect(0, 20, w * 20, 20);
			platformCostume.graphics.endFill();
			platformCostume.rotation = angle;
			platformCostume.x = x * 20;
			platformCostume.y = y * 20;
			costume.addChild(platformCostume);
		}
	}
}