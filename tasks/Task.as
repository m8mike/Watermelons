package  {
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class Task {
		private static var taskBar:MovieClip;
		protected var description:String;
		
		public function Task(description:String) {
			this.description = description;
			show();
		}
		
		protected function show():void {
			taskBar = new MovieClip();
			taskBar.graphics.beginFill(0x000000, 0.5);
			taskBar.graphics.drawRoundRect(500, 10, 300, 100, 10, 10);
			taskBar.graphics.endFill();
			Menu.addText(description, 500, 10, taskBar, 0xFFFFFF);
			Platformer.instance.stage.addChild(taskBar);
		}
	}
}