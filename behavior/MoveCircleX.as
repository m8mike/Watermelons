package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import flash.geom.Point;
	
	/**
	* 
	* @author Mad Mike
	*/
	public class MoveCircleX extends Behavior {
		private var radius:Number;
		private var speed:Number;
		private var angle:Number;
		private var center:Point;
		
		public function MoveCircleX(center:Point, radius:Number, body:b2Body, speed:Number = 0.02, startAngle:Number = 0) {
			this.speed = speed;
			this.radius = radius;
			this.center = center;
			this.angle = startAngle;
			super(body);
			setLoc();
		}
		
		private function setLoc():void {
			var loc:b2Vec2 = new b2Vec2(center.x / PhysicalWorld.RATIO, center.y / PhysicalWorld.RATIO);
			loc.x += radius * Math.cos(angle);
			loc.y += radius * Math.sin(angle);
			body.SetXForm(loc, angle-Math.PI);
		}
		
		override public function update():void {
			angle+=speed;
			if (angle >= 360) {
				angle = 0;
			}
			setLoc();
			super.update();
		}
	}
}