package {
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class ForwardVerticalElevators extends Terrain {
		
		public function ForwardVerticalElevators(location:Point, numElevators:int) {
			var height:int = Math.random() * 30 + 10;
			super(location, numElevators);
			new Standard(location.x, location.y, 10, 10);
			addPlatformCostume(location.x, location.y, 10, 10);
			var offset:int = 10;
			for (var i:int = 0; i < numElevators; i++) {
				new Spikes(location.x + offset, location.y+10, 10, 10);
				addSpikesCostume(location.x + offset, location.y + 10, 10, 10);
				new StandardUnfixedMoving(location.x + offset, location.y + 2, 
										new Point(location.x + offset, location.y - 10), 10, 2);
				offset += 10;
			}
			new Standard(location.x + offset, location.y, 10, 10);
			addPlatformCostume(location.x + offset, location.y, 10, 10);
			finishPoint = new Point(location.x + 10 + offset, (location.y-10)*20);
		}
	}
}