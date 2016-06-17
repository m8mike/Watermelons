package {
	import flash.display.MovieClip;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class JumpRockTunnelTerrain extends Terrain {
		
		public function JumpRockTunnelTerrain(location:Point) {
			super(location, 1);
			var rockHeight:Number = Math.random() * 15 + 5;
			new Standard(location.x, location.y, 15, 2);
			addPlatformCostume(location.x, location.y, 15, 2);
			new Standard(15 + location.x, location.y - rockHeight, rockHeight * 2 + 5, rockHeight);
			addPlatformCostume(15 + location.x, location.y - rockHeight, rockHeight * 2 + 5, rockHeight);
			new Standard(15 + location.x, location.y - rockHeight * 2 - 10, rockHeight * 2, rockHeight);
			addPlatformCostume(15 + location.x, location.y - rockHeight * 2 - 10, rockHeight * 2, rockHeight);
			new JumpBoost(5 + location.x, location.y - 3);
			new JumpBoost(10 + location.x, location.y - 3);
			finishPoint = new Point(location.x + rockHeight * 2 + 5 + 15, (location.y - 10 - rockHeight) * 20);
		}
	}
}