package {
	import flash.display.DisplayObjectContainer;
	import flash.events.MouseEvent;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class MenuItem {
		public var itemText:TextField;
		private var itemShadow:TextField;
		private var menu:Menu;
		public var onClick:Function;
		
		public function MenuItem(text:String, parent:Menu, onClick:Function) {
			menu = parent;
			itemText = new TextField();
			itemText.text = text;
			itemText.x = 20 + 200 * int(menu.items.length/8);
			itemText.y = 140 + 60 * (menu.items.length % 8);
			itemText.visible = true;
			itemText.selectable = false;
			var mytf:TextFormat = new TextFormat();
			var font:Font = new SlugfestNF();
			mytf.font = font.fontName;
			mytf.size = 40;
			mytf.align = TextFormatAlign.CENTER;
			itemText.setTextFormat(mytf);
			itemText.defaultTextFormat = mytf;
			itemText.width = 600;
			itemText.height = 100;
			itemText.textColor = 0xFFFFFF;
			itemText.multiline = true;
			itemText.wordWrap = true;
			itemShadow = new TextField();
			itemShadow.text = text;
			itemShadow.x = itemText.x + 5;
			itemShadow.y = itemText.y + 5;
			itemShadow.visible = true;
			itemShadow.selectable = false;
			itemShadow.setTextFormat(mytf);
			itemShadow.defaultTextFormat = mytf;
			itemShadow.width = 600;
			itemShadow.height = 100;
			itemShadow.textColor = 0x000000;
			itemShadow.multiline = true;
			itemShadow.wordWrap = true;
			parent.addChild(itemShadow);
			parent.addChild(itemText);
			itemText.addEventListener(MouseEvent.MOUSE_MOVE, select);
			itemShadow.addEventListener(MouseEvent.MOUSE_MOVE, select);
			//itemText.addEventListener(MouseEvent.MOUSE_DOWN, press);
			//itemShadow.addEventListener(MouseEvent.MOUSE_DOWN, press);
			if (!onClick) {
				return void;
			}
			itemText.addEventListener(MouseEvent.CLICK, onClick);
			itemShadow.addEventListener(MouseEvent.CLICK, onClick);
			this.onClick = onClick;
		}
		
		private function press(e:MouseEvent):void {
			if (menu.pressed == -1) {	
				itemText.x += 4;
				itemText.y += 4;
				menu.setCurrent(menu.items.indexOf(this));
				menu.pressed = menu.items.indexOf(this);
			}
		}
		
		private function select(e:MouseEvent):void {
			menu.setCurrent(menu.items.indexOf(this));
		}
		
		public function deactivate():void {
			if (itemText.textColor == 0x00FF00) {
				itemText.textColor = 0xFFFFFF;
				itemShadow.textColor = 0x000000;
			}
		}
		
		public function activate():void {
			if (itemText.textColor == 0xFFFFFF) {
				itemText.textColor = 0x00FF00;
				itemShadow.textColor = 0xFF0000;
			}
		}
		
		public function hide():void {
			itemText.visible = false;
			itemShadow.visible = false;
		}
		
		public function show():void {
			itemText.visible = true;
			itemShadow.visible = true;
		}
		
		public function remove():void {
			itemText.parent.removeChild(itemText);
			itemShadow.parent.removeChild(itemShadow);
			itemText = null;
			itemShadow = null;
		}
	}
}