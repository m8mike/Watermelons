package  {
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class GameLevel {
		public static var explodingRoads:Array = [];
		protected var spawnLoc:Point = new Point(5, -5);
		protected var lastCheckpointLoc:Point = new Point();
		protected var gameMode:GameMode;
		
		public function GameLevel(gameMode:GameMode = null) {
			if (gameMode) {
				this.gameMode = gameMode;
			} else {
				this.gameMode = new FreeRide();
			}
		}
		
		public function getSpawnLoc():Point {
			if (gameMode.respawnAtCheckpoints) {
				return lastCheckpointLoc.clone();
			}
			return spawnLoc.clone();
		}
		
		public function setSpawnLoc(x:Number, y:Number):void {
			spawnLoc.x = x;
			spawnLoc.y = y;
		}
		
		public function setLastCheckpointLoc(x:Number, y:Number):void {
			lastCheckpointLoc.x = x;
			lastCheckpointLoc.y = y;
		}
		
		public function onStunt(numStunts:int = 1):void {
			gameMode.onStunt(numStunts);
		}
		
		public function onCheckpoint():void {
			gameMode.onCheckpoint();
		}
		
		public function respawn():void {
			gameMode.onRespawn();
			VehicleManager.currentVehicle.respawn();
			restartExploadingRoads();
		}
		
		private function restartExploadingRoads():void {
			for each (var road:ExplodingRoad in explodingRoads) {
				road.restart();
			}
		}
	}
}