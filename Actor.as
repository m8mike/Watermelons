package {
	import flash.events.EventDispatcher;
	import flash.geom.Point;
	
	/**
	 * Represents all kind of objects in the game world - 
	 * characters, platforms, collectibles and decorations
	 * @author Mad Mike
	 */
	public class Actor {
		public var location:Point;
		
		public function Actor(loc:Point) {
			location = loc;
		}
		
		public function update():void {}
		
		public function hide():void {
			location = getSpriteLoc();
			removeBodies();
		}
		
		public function destroy():void {
			cleanUpBeforeRemoving();
		}
		
		protected function cleanUpBeforeRemoving():void {
			removeBodies();
			removeCostumes();
		}
		
		protected function removeBodies():void {}
		protected function removeCostumes():void {}
		
		public function getSpriteLoc():Point {
			return null;
		}
		
		public function getXML():XML {
			return null;
		}
	}
}