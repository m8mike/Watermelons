package 
{
	import Box2D.Common.Math.b2Vec2;
	import flash.geom.Point;
	/**
	 * ...
	 * @author ...
	 */
	public class CannonMovingRotating extends CannonSuper {
		private var move:MoveABX;
		private var rotate:RotateX;
		
		public function CannonMovingRotating(x:Number, y:Number, loc1:Point, angle:Number) {
			super(x, y);
			setAngle(angle);
			loc1.x *= PhysicalWorld.MIN_SQARE;
			loc1.y *= PhysicalWorld.MIN_SQARE;
			move = new MoveABX(location, loc1, body, 0.1, angle);
			rotate = new RotateX(1, body, angle);
		}
		
		override public function update():void {
			move.update();
			rotate.update();
			super.update();
		}
	}
}