package  {
	import flash.display.MovieClip;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class JumpRockTerrain extends Terrain {
		
		public function JumpRockTerrain(location:Point) {
			super(location, 1);
			var rockHeight:Number = Math.random() * 15 + 5;
			new Standard(location.x, location.y, 15, 2);
			addPlatformCostume(location.x, location.y, 15, 2);
			new Standard(15 + location.x, location.y - rockHeight, rockHeight, rockHeight);
			addPlatformCostume(15 + location.x, location.y - rockHeight, rockHeight, rockHeight);
			new JumpBoost(5 + location.x, location.y - 3);
			new JumpBoost(10 + location.x, location.y - 3);
			finishPoint = new Point(location.x + rockHeight + 15, (location.y - 10 - rockHeight)*20);
		}
	}
}