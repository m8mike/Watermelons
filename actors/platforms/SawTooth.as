package {
	import Box2D.Dynamics.b2Body;
	import flash.geom.Point;
	
	/**
	 * 
	 * @author Mad Mike
	 */
	public class SawTooth extends Standard {
		private var angle:Number;
		private var height2:Number;
		
		public function SawTooth(x:Number, y:Number, width:Number, height:Number, height2:Number) {
			this.angle = angle;
			this.height2 = height2;
			super(x, y, width, height);
		}
		
		override protected function createShapes():void {
			shape = new SawToothShape(width * PhysicalWorld.MIN_SQARE, 
									  height * PhysicalWorld.MIN_SQARE, 
									  height2 * PhysicalWorld.MIN_SQARE);
		}
	}
}