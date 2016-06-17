package {
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class Menu extends MovieClip {
		private var current:int;
		public var items:Array = [];
		public var pressed:int = -1;
		public var currentChanged:Boolean = false;
		
		public function Menu(parent:DisplayObjectContainer) {
			parent.addChild(this);
			Updatables.addMenu(this);
		}
		
		public function update():void {
			if (visible) {
				control();
			}
		}
		
		public function setCurrent(index:int):void {
			if (pressed != -1) return void;
			for each (var i:MenuItem in items) {
				i.deactivate();
			}
			current = index;
			MenuItem(items[current]).activate();
			currentChanged = true;
		}
		
		public function control():void {
			if (Controls.up) {
				if (currentChanged) {
					return void;
				}
				if (current == 0) {
					setCurrent(items.length - 1);
				} else {
					setCurrent(current - 1);
				}
			} else if (Controls.down) {
				if (currentChanged) {
					return void;
				}
				if (current == items.length - 1) {
					setCurrent(0);
				} else {
					setCurrent(current + 1);
				}
			} else if (Controls.right) {
				if (!MenuItem(items[current]).onClick) {
					return void;
				}
				MenuItem(items[current]).onClick(null);	
			} else {
				currentChanged = false;
			}
		}
		
		public static function addText(text:String, x:int, y:int, parent:DisplayObjectContainer, color:uint = 0x000000):void {
			var textField:TextField = new TextField();
			textField.x = x;
			textField.y = y;
			textField.visible = true;
			textField.selectable = false;
			textField.text = text;
			var textFormat:TextFormat = new TextFormat();
			var font:Font = new SlugfestNF();
			textFormat.font = font.fontName;
			textFormat.bold = true;
			textFormat.size = 40;
			textField.setTextFormat(textFormat);
			textField.defaultTextFormat = textFormat;
			textField.width = 500;
			textField.height = 70;
			textField.textColor = color;
			parent.addChild(textField);
		}
		
		public static function addText2(text:String, x:int, y:int, parent:DisplayObjectContainer):void {
			var textField:TextField = new TextField();
			textField.x = x;
			textField.y = y;
			textField.visible = true;
			textField.selectable = false;
			textField.text = text;
			var textFormat:TextFormat = new TextFormat();
			var font:Font = new HeroFont();
			textFormat.font = font.fontName;
			textFormat.bold = true;
			textFormat.size = 20;
			textField.setTextFormat(textFormat);
			textField.defaultTextFormat = textFormat;
			textField.width = 500;
			textField.height = 70;
			textField.textColor = 0x000000;
			parent.addChild(textField);
		}
	}
}