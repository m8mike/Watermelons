package {
	
	/**
	 * ...
	 * @author ...
	 */
	public class Werewolf extends Dummy {
		public var jump:Jump;
		//private var costumeManager:WerewolfCostumeManager;
		
		public function Werewolf(x:int, y:int) {
			super(x, y, 2.5, 3);
			jump = new Jump(condition, bodyManager.body);
			jump.dispatchAutomatedJump(100, -50);
			//costumeManager = new WerewolfCostumeManager(this);
		}
		
		override public function update():void {
			jump.update();
			//costumeManager.update();
			super.update();
		}
	}
}