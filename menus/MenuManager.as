package {
	import flash.display.DisplayObjectContainer;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class MenuManager {
		private var layer:DisplayObjectContainer;
		private var mainMenu:MainMenu;
		private var pauseMenu:PauseMenu;
		
		public function MenuManager(menuLayer:DisplayObjectContainer) {
			layer = menuLayer;
			mainMenu = new MainMenu(layer);
		}
		
		public function pause():void {
			if (!pauseMenu) {
				pauseMenu = new PauseMenu(layer);
			} else {
				pauseMenu.visible = true;
			}
		}
		
		public function openMainMenu():void {
			mainMenu.visible = true;
			Updatables.removeAll();
		}
	}
}