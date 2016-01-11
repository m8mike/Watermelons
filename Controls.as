package {
	import flash.display.Sprite;
	import flash.display.StageDisplayState;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	
	/**
	 * обработчик событий клавиатуры
	 * @author Mad Mike
	 */
	public class Controls {
		public static var left:Boolean = false;
		public static var right:Boolean = false;
		public static var up:Boolean = false;
		public static var down:Boolean = false;
		
		public static var enter:Boolean = false;
		public static var useItem:Boolean = false;
		public static var shootCannon:Boolean = false;
		
		public static var zoom:Boolean = false;
		public static var unzoom:Boolean = false;
		
		public static var controls:Array = [];
		
		public static var allowed:Boolean = false;
		
		public function Controls() {
			if (!Platformer.instance.stage.hasEventListener(KeyboardEvent.KEY_DOWN)) {
				Platformer.instance.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
				Platformer.instance.stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
				allowed = true;
			}
		}
		
		public static function allowControls():void {
			allowed = true;
		}
		
		public static function disallowControls():void {
			allowed = false;
			upKeys();
		}
		
		public static function upKeys():void {
			keyUp(new KeyboardEvent(KeyboardEvent.KEY_UP, true, false, 90, 90));
			keyUp(new KeyboardEvent(KeyboardEvent.KEY_UP, true, false, 81, 81));
			keyUp(new KeyboardEvent(KeyboardEvent.KEY_UP, true, false, 69, 69));
			keyUp(new KeyboardEvent(KeyboardEvent.KEY_UP, true, false, 37, 37));
			keyUp(new KeyboardEvent(KeyboardEvent.KEY_UP, true, false, 65, 65));
			keyUp(new KeyboardEvent(KeyboardEvent.KEY_UP, true, false, 38, 38));
			keyUp(new KeyboardEvent(KeyboardEvent.KEY_UP, true, false, 87, 87));
			keyUp(new KeyboardEvent(KeyboardEvent.KEY_UP, true, false, 39, 39));
			keyUp(new KeyboardEvent(KeyboardEvent.KEY_UP, true, false, 68, 68));
			keyUp(new KeyboardEvent(KeyboardEvent.KEY_UP, true, false, 40, 40));
			keyUp(new KeyboardEvent(KeyboardEvent.KEY_UP, true, false, 83, 83));
			keyUp(new KeyboardEvent(KeyboardEvent.KEY_UP, true, false, 70, 70));
			keyUp(new KeyboardEvent(KeyboardEvent.KEY_UP, true, false, 192, 192));
		}
		
		private static function keyDown(e:KeyboardEvent):void {
			if (!allowed) {
				return void;
			}
			switch (e.keyCode) {
				case Keyboard.Q:
					unzoom = true;
					break;
				case Keyboard.E:
					zoom = true;
					break;
				case Keyboard.LEFT:
					left = true;
					break;
				case Keyboard.A:
					left = true;
					break;
				case Keyboard.X:
					useItem = true;
					enter = true;
					break;
				case Keyboard.ENTER:
					enter = true;
					break;
				case Keyboard.SPACE:
					up = true;
					break;
				case Keyboard.UP:
					up = true;
					break;
				case Keyboard.W:
					up = true;
					break;
				case Keyboard.RIGHT:
					right = true;
					break;
				case Keyboard.D:
					right = true;
					break;
				case Keyboard.DOWN:
					down = true;
					break;
				case Keyboard.S:
					down = true;
					break;
				case Keyboard.BACKQUOTE:
					//Platformer.setFullScreen();
					break;
			}
		}
		
		private static function keyUp(e:KeyboardEvent):void {
			switch (e.keyCode) {
				case 13: //Enter
					enter = false;
					break;
				case 81: //q
					unzoom = false;
					left = false;
					up = false;
					break;
				case 69: //e
					zoom = false;
					right = false;
					up = false;
					break;
				case 37: //Left
					left = false;
					break;
				case 65: //a
					left = false;
					break;
				case Keyboard.X:
					useItem = false;
					enter = false;
					break;
				case Keyboard.SPACE:
					up = false;
						if (Platformer.player) {
							Platformer.player.clearJumps();
						}
					break;
				case 38: //Up
					up = false;
						if (Platformer.player) {	
							Platformer.player.clearJumps();
						}
					break;
				case 87: //w
					up = false;
						if (Platformer.player) {	
							Platformer.player.clearJumps();
						}
					break;
				case 39: //Right
					right = false;
					break;
				case 68: //d
					right = false;
					break;
				case 40: //Down
					down = false;
					break;
				case 83: //s
					down = false;
					break;
				case 70: //Fly
					break;
			}
		}
	}
}