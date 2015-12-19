package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class MoveAB extends Behavior {
		private var vel1:b2Vec2;
		private var vel2:b2Vec2;
		private var k:int = 2;
		
		public var point1:Point;
		public var point2:Point;
		public var direction:int = 1;
		
		public function MoveAB(loc1:Point, loc2:Point, body:b2Body) {
			point1 = loc1.clone();
			point2 = loc2.clone();
			setVelocities();
			super(body);
		}
		
		private function setVelocities():void {
			if (point1.x == point2.x) {
				if (point1.y > point2.y) {
					vel1 = new b2Vec2(0, -k);
				} else if (point1.y < point2.y) {
					vel1 = new b2Vec2(0, k);
				}
			} else if (point1.x > point2.x) {
				if (point1.y == point2.y) {
					vel1 = new b2Vec2(-k, 0);
				} else
					vel1 = new b2Vec2(k * Math.cos(Math.atan((point1.y - point2.y) / (point1.x - point2.x))), 
									  k * Math.sin(Math.atan((point1.y - point2.y) / (point1.x - point2.x))));
			} else if (point1.x < point2.x) {
				if (point1.y == point2.y) {
					vel1 = new b2Vec2(k, 0);
				} else
					vel1 = new b2Vec2(k * Math.cos(Math.atan((point2.y - point1.y) / (point2.x - point1.x))), 
									  k * Math.sin(Math.atan((point2.y - point1.y) / (point2.x - point1.x))));
			}
			vel2 = new b2Vec2(-vel1.x, -vel1.y);
		}
		
		private function findDirection(loc:b2Vec2):void {
			if (point1.x == point2.x) {
				if (point1.y > point2.y) {
					if (loc.y >= point1.y) {
						direction = 1;
					} else if (loc.y <= point2.y) {
						direction = -1;
					}
				}
			} else if (point1.x > point2.x) {
				if (loc.x >= point1.x) {
					direction = 1;
				} else if (loc.x <= point2.x) {
					direction = -1
				}
			} else if (point1.x < point2.x) {
				if (loc.x <= point1.x) {
					direction = 1;
				} else if (loc.x >= point2.x) {
					direction = -1;
				}
			}
		}
		
		override public function update():void {
			if (point2 != null) {
				var center:b2Vec2 = body.GetWorldCenter().Copy();
				center.Multiply(PhysicalWorld.RATIO);
				findDirection(center);
				if (direction == 1) {
					body.SetLinearVelocity(vel1);
				} else 
				if (direction == -1) {
					body.SetLinearVelocity(vel2);
				}
				body.ApplyForce(new b2Vec2(0.0, -10.0 * body.GetMass()), body.GetWorldCenter());
			}
			super.update();
		}
	}
}