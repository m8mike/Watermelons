package  {
	import flash.display.DisplayObjectContainer;
	import flash.display.Stage;
	import flash.events.Event;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class PauseMenu extends Menu {
		
		public function PauseMenu(layer:DisplayObjectContainer) {
			super(layer);
			items.push(new MenuItem("Resume", this, resume));
			items.push(new MenuItem("Restart", this, null));
			items.push(new MenuItem("Settings", this, null));
			items.push(new MenuItem("Quit", this, quit));
			setCurrent(0);
		}
		
		private function resume(e:Event):void {
			visible = false;
			PhysicalWorld.unpause();
		}
		
		private function quit(e:Event):void {
			visible = false;
			MyTimer.hide();
			Platformer.menuManager.openMainMenu();
		}
	}
}