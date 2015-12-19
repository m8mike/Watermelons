package {
	
	/**
	 * ...
	 * @author ...
	 */
	public class Updatables {
		private static var characters:Array = [];
		private static var platforms:Array = [];
		private static var collectibles:Array = [];
		
		public static function updateAll():void {
			for each (var character:Actor in characters) {
				character.update();
			}
			for each (var platform:Actor in platforms) {
				platform.update();
			}
			for each (var collectible:Actor in collectibles) {
				collectible.update();
			}
			//Animation.updateAll();
		}
		
		public static function addCharacter(character:Character):void {
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
		
		public static function removeCharacter(character:Character):void {
			characters.splice(characters.indexOf(character), 1);
		}
		
		public static function removePlatform(platform:Platform):void {
			platforms.splice(platforms.indexOf(platform), 1);
		}
		
		public static function removeCollectible(collectible:Collectible):void {
			collectibles.splice(collectibles.indexOf(collectible), 1);
		}
	}
}