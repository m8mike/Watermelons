package {
	import Box2D.Common.Math.b2Vec2;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Updatables {
		private static var characters:Array = [];
		private static var platforms:Array = [];
		private static var collectibles:Array = [];
		private static var vehicles:Array = [];
		
		public static function updateAll():void {
			for each (var character:Actor in characters) {
				character.update();
			}
			for each (var platform:Platform in platforms) {
				var pp:Point = platform.location.clone();
				var dist:Number = Point.distance(Platformer.player.getSpriteLoc(), pp);
				if (dist > 1000) {
					platform.hide();
				} else {
					platform.show();
				}
				if (platform.getBody()) {	
					platform.update();
				}
			}
			for each (var collectible:Actor in collectibles) {
				collectible.update();
			}
			for each (var vehicle:Vehicle in vehicles) {
				pp = vehicle.location.clone();
				dist = Point.distance(Platformer.player.getSpriteLoc(), pp);
				if (dist < 500 || vehicle.enterable.inside) {
					vehicle.update();
				} else {
					if (!vehicle.getBody().IsSleeping()) {	
						vehicle.getBody().PutToSleep();
					}
				}
			}
			//Animation.updateAll();
		}
		
		public static function addCharacter(character:Actor):void {
			if (characters.indexOf(character) == -1) {
				characters.push(character);
			}
		}
		
		public static function addPlatform(platform:Platform):void {
			if (platforms.indexOf(platform) == -1) {
				platforms.push(platform);
			}
		}
		
		public static function addCollectible(collectible:Collectible):void {
			if (collectibles.indexOf(collectible) == -1) {
				collectibles.push(collectible);
			}
		}
		
		public static function addVehicle(vehicle:Vehicle):void {
			if (vehicles.indexOf(vehicle) == -1) {
				vehicles.push(vehicle);
			}
		}
		
		public static function removeCharacter(character:Character):void {
			characters.splice(characters.indexOf(character), 1);
		}
		
		public static function removePlatform(platform:Platform):void {
			platforms.splice(platforms.indexOf(platform), 1);
		}
		
		public static function removeCollectible(collectible:Collectible):void {
			collectibles.splice(collectibles.indexOf(collectible), 1);
		}
		
		public static function removeVehicle(vehicle:Vehicle):void {
			vehicles.splice(vehicles.indexOf(vehicle), 1);
		}
	}
}