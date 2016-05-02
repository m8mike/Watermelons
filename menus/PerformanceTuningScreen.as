package  {
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class PerformanceTuningScreen {
		private var offset:Point = new Point(10, 50);
		private var screenLayer:MovieClip;
		//s:10,a:6,r:3,j:7,n:1
		public function PerformanceTuningScreen(parent:DisplayObjectContainer) {
			screenLayer = new MovieClip();
			parent.addChild(screenLayer);
			var yPos:int = 0;
			addRow("Max speed:10", yPos, 100);
			yPos += 23 * 4;
			addRow("Acceleration:10", yPos, 140);
			yPos += 23 * 4;
			addRow("Rotation:10", yPos, 110);
			yPos += 23 * 4;
			addRow("Jump:10", yPos, 180);
			yPos += 23 * 4;
			addRow("Nitro:10", yPos, 170);
			addText("< Back", 0, 0, screenLayer);
			addText("Start >", 570, 400, screenLayer);
			addText("Balance: $100", 500, 0, screenLayer);
			var buttonStart:MovieClip = new MovieClip();
			buttonStart.graphics.beginFill(0x8000FF, 1);
			buttonStart.graphics.drawRect(570, 400, 200, 200);
			buttonStart.graphics.endFill();
			buttonStart.addEventListener(TouchEvent.TOUCH_TAP, hide);
			screenLayer.addChild(buttonStart);
		}
		
		public function isVisible():Boolean {
			return screenLayer.visible;
		}
		
		public function hide(e:Event):void {
			screenLayer.visible = false;
		}
		
		public function show(e:Event):void {
			screenLayer.visible = true;
		}
		
		private function addText(text:String, x:int, y:int, parent:DisplayObjectContainer):void {
			Menu.addText(text, x, y, parent);
		}
		
		private function addRow(text:String, yPos:int, cost:int = 0):void {
			var back:MovieClip = new MovieClip();
			back.graphics.beginFill(0x8000FF, 0.95);
			back.graphics.drawRect(offset.x + 80, offset.y+yPos, 330, 80);
			back.graphics.endFill();
			screenLayer.addChild(back);
			var plus:MovieClip = new button_plus();
			plus.x = offset.x+420;
			plus.y  = offset.y+yPos;
			screenLayer.addChild(plus);
			var minus:MovieClip = new button_minus();
			minus.x = offset.x;
			minus.y  = offset.y+yPos;
			screenLayer.addChild(minus);
			addText(text, offset.x + 80, offset.y + yPos + 20, screenLayer);
			Menu.addText2("Current level:1", offset.x + 180, offset.y + yPos + 50, screenLayer);
			if (cost) {
				addText("$" + cost, offset.x + 460, offset.y + yPos, screenLayer);
			}
		}
	}
}