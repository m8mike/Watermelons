package 
{
	import Box2D.Common.Math.b2Vec2;
	import flash.geom.Point;
	/**
	 * ...
	 * @author ...
	 */
	public class CannonCircleMoving extends CannonSuper {
		private var move:MoveCircleX;
		
		public function CannonCircleMoving(x:Number, y:Number, radius:Number, angle:Number) {
			super(x, y);
			setAngle(angle);
			move = new MoveCircleX(location, radius, body, 0.1, angle);
		}
		
		override public function update():void {
			move.update();
			super.update();
		}
	}
}