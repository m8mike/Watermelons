package  {
	import Box2D.Dynamics.b2Body;
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class ExplodingPlatform extends Platform {
		private var removingTimer:RemovingTimer;
		protected var parent:MovieClip;
		protected var costume:MovieClip;
		
		public function ExplodingPlatform(x:Number, y:Number, w:Number = 1, h:Number = 1) {
			parent = CameraManager.gameLayer;
			super(x, y, w, h);
			initCostume();
			removingTimer = new RemovingTimer(this, 5);
		}
		
		public function restart():void {
			if (!body && !deleted) {
				Updatables.addPlatform(this);
				removingTimer.deactivate();
				initCostume();
			}
		}
		
		override public function hit(bodyHit:b2Body):void {
			removingTimer.activate();
		}
		
		override public function update():void {
			if (deleted) {
				return void;
			}
			removingTimer.update();
			super.update();
		}
		
		override public function show():void {
			initCostume();
			super.show();
		}
		
		protected function initCostume():void {
			if (!costume) {
				costume = new MovieClip();
				var color:uint = 0x000000;
				costume.graphics.beginFill(color);
				costume.graphics.drawRect(0, 0, 2 * 20, 2 * 20);
				costume.graphics.endFill();
				costume.graphics.beginFill(0xFF0000);
				costume.graphics.drawCircle(20, 20, 15);
				costume.graphics.endFill();
				costume.graphics.beginFill(0xFFFFFF);
				costume.graphics.drawCircle(17, 17, 5);
				costume.graphics.endFill();
				costume.x = location.x;
				costume.y = location.y;
			}
			if (!costume.parent) {
				parent.addChild(costume);
			}
		}
		
		override protected function cleanUpBeforeRemoving():void {
			if (costume.parent) {
				costume.parent.removeChild(costume);
			}
			super.cleanUpBeforeRemoving();
		}
		
		override public function hide():void {
			if (costume.parent) {
				costume.parent.removeChild(costume);
			}
			super.hide();
		}
	}
}