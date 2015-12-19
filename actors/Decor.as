package {
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Decor extends Actor {
		
		public function Decor() {
			Platformer.decorations.push(this);
		}
		
		override protected function cleanUpBeforeRemoving():void {
			Platformer.decorations.splice(Platformer.decorations.indexOf(this), 1);
			super.cleanUpBeforeRemoving();
		}
	}
}