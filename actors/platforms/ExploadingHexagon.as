package {
	import Box2D.Dynamics.b2Body;
	import flash.display.MovieClip;
	import flash.geom.Point;
	
	/**
	 * platform that lets player slide on its side
	 * @author Mad Mike
	 */
	public class ExploadingHexagon extends ExplodingPlatform {
		private var radius:Number;
		
		public function ExploadingHexagon(x:Number, y:Number, r:Number = 1) {
			radius = r;
			super(x, y, r, r);
		}
		
		override protected function createShapes():void {
			shape = new HexShape(radius * PhysicalWorld.MIN_SQARE);
		}
		
		override protected function initCostume():void {
			if (!costume) {
				costume = new MovieClip();
				var color:uint = 0x000000;
				costume.graphics.beginFill(color);
				costume.graphics.moveTo(20 + Math.cos(0) * 40, 20 + Math.sin(0) * 40);
				for (var i:int = 1; i <= 6; i++) {
					costume.graphics.lineTo(20 + Math.cos(((i * 60) % 360) / 180 * Math.PI) * 40, 
											20 + Math.sin(((i * 60) % 360) / 180 * Math.PI) * 40);
				}
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
	}
}