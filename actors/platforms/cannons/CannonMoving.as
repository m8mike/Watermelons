package 
{
	import Box2D.Common.Math.b2Vec2;
	import flash.geom.Point;
	/**
	 * ...
	 * @author ...
	 */
	public class CannonMoving extends CannonSuper {
		private var shape2:CircleShape;
		private var move:MoveABX;
		
		public function CannonMoving(x:Number, y:Number, loc1:Point, angle:Number) {
			super(x, y);
			setAngle(angle);
			loc1.x *= PhysicalWorld.MIN_SQARE;
			loc1.y *= PhysicalWorld.MIN_SQARE;
			move = new MoveABX(location, loc1, body, 0.1, angle);
		}
		
		override public function update():void {
			move.update();
			super.update();
		}
	}
}