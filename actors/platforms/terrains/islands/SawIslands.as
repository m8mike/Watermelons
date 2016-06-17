package {
	import flash.display.MovieClip;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class SawIslands extends Terrain {
		
		public function SawIslands(location:Point, numIslands:int) {
			super(location, numIslands);
			new Standard(location.x, location.y, 10, 10);
			addPlatformCostume(location.x, location.y, 10, 10);
			new Spikes(location.x + 10, location.y+8, 10, 2);
			addSpikesCostume(location.x + 10, location.y+8, 10, 2);
			for (var i:int = 0; i < numIslands; i++) {
				new SawTooth(location.x + 20 + 20 * i, location.y, 10, 10, 3);
				addIslandCostume(location.x + 20 + 20 * i, location.y, 10, 10, 3);
				new Spikes(location.x + 30 + 20 * i, location.y+8, 10, 2);
				addSpikesCostume(location.x + 30 + 20 * i, location.y+8, 10, 2);
			}
			new Standard(location.x + 20 + 20 * numIslands, location.y, 10, 10);
			addPlatformCostume(location.x + 20 + 20 * numIslands, location.y, 10, 10);
			finishPoint = new Point(location.x + 30 + 20 * numIslands, (location.y-10)*20);
		}
		
		private function addIslandCostume(x:Number, y:Number, w:Number, h:Number, h2:Number):void {
			costume.addChild(getIslandCostume(x, y, w, h, h2));
		}
		
		public static function getIslandCostume(x:Number, y:Number, w:Number, h:Number, h2:Number):MovieClip {
			var islandCostume:MovieClip = new MovieClip();
			islandCostume.graphics.beginFill(0xAC0B0B);
			islandCostume.graphics.moveTo(0, 0);
			islandCostume.graphics.lineTo(w*20, -h2*20);
			islandCostume.graphics.lineTo(w*20, h*20);
			islandCostume.graphics.lineTo(0, h*20);
			islandCostume.graphics.endFill();
			islandCostume.graphics.beginFill(0x707070);
			islandCostume.graphics.moveTo(0, -20);
			islandCostume.graphics.lineTo(w * 20, -h2 * 20 - 20);
			islandCostume.graphics.lineTo(w * 20, -h2 * 20 + 10);
			islandCostume.graphics.lineTo(0, 10);
			islandCostume.graphics.endFill();
			islandCostume.graphics.beginFill(0x000000);
			islandCostume.graphics.moveTo(0, 10);
			islandCostume.graphics.lineTo(w * 20, -h2 * 20 + 10);
			islandCostume.graphics.lineTo(w * 20, -h2 * 20 + 20);
			islandCostume.graphics.lineTo(0, 20);
			islandCostume.graphics.endFill();
			islandCostume.graphics.beginFill(0x4B0505);
			islandCostume.graphics.moveTo(0, 20);
			islandCostume.graphics.lineTo(w * 20, -h2 * 20 + 20);
			islandCostume.graphics.lineTo(w * 20, -h2 * 20 + 40);
			islandCostume.graphics.lineTo(0, 40);
			islandCostume.graphics.endFill();
			islandCostume.x = x * 20;
			islandCostume.y = y * 20;
			return islandCostume;
		}
	}
}