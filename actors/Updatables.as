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
		private static var menus:Array = [];
		public static var modeUpdate:Function;
		
		public static function updateAll():void {
			for each (var character:Actor in characters) {
				character.update();
			}
			for each (var platform:Platform in platforms) {
				var pLoc:Point = platform.getCenter();
				var dist:Number = Point.distance(Platformer.player.getSpriteLoc(), pLoc);
				if (dist > 1000) {
					platform.hide();
				} else {
					platform.show();
				}
				if (platform.getBody()) {
					platform.update();
				}
			}
			for each (var collectible:Collectible in collectibles) {
				collectible.update();
				var cLoc:Point = collectible.location.clone();
				dist = Point.distance(Platformer.player.getSpriteLoc(), cLoc);
				if (dist > 1000) {
					collectible.hide();
				} else if (!collectible.deleted) {
					collectible.show();
				}
			}
			for each (var vehicle:Vehicle in vehicles) {
				var vLoc:Point = vehicle.location.clone();
				dist = Point.distance(Platformer.player.getSpriteLoc(), vLoc);
				if (dist < 500 || vehicle.enterable.inside) {
					vehicle.update();
				} else {
					if (!vehicle.getBody().IsSleeping()) {
						vehicle.getBody().PutToSleep();
					}
				}
			}
			for each (var menu:Menu in menus) {
				menu.update();
			}
			if (modeUpdate != null) {
				modeUpdate();
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
		
		public static function addMenu(menu:Menu):void {
			if (menus.indexOf(menu) == -1) {
				menus.push(menu);
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
		
		public static function removeMenu(menu:Menu):void {
			menus.splice(menus.indexOf(menu), 1);
		}
		
		public static function removeAll():void {
			while (characters.length) {
				characters[0].deleted = true;
				characters[0].destroy();
			}
			while (platforms.length) {
				platforms[0].deleted = true;
				platforms[0].destroy();
			}
			while (collectibles.length) {
				collectibles[0].deleted = true;
				collectibles[0].destroy();
			}
			while (vehicles.length) {
				vehicles[0].deleted = true;
				vehicles[0].destroy();
			}
			while (CameraManager.gameLayer.numChildren) {
				CameraManager.gameLayer.removeChildAt(0);
			}
			MyTimer.reset();
			/*trace(characters.length + " characters not deleted");
			trace(platforms.length + " platforms not deleted");
			trace(collectibles.length + " collectibles not deleted");
			trace(vehicles.length + " vehicles not deleted");*/
			/*for each (var character:Actor in characters) {
				character.destroy();
				character.deleted = true;
			}
			for each (var platform:Platform in platforms) {
				platform.destroy();
				platform.deleted = true;
			}
			for each (var collectible:Collectible in collectibles) {
				collectible.destroy();
				collectible.deleted = true;
			}
			for each (var vehicle:Vehicle in vehicles) {
				vehicle.destroy();
				vehicle.deleted = true;
			}*/
		}
	}
}