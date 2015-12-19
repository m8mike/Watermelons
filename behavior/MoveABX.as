package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import flash.geom.Point;
	
	/**
	* 
	* @author Mad Mike
	*/
	public class MoveABX extends Behavior {
		private var vel1:b2Vec2;
		private var vel2:b2Vec2;
		private var speed:Number;
		private var angle:Number;
		
		public var point1:Point;
		public var point2:Point;
		public var direction:int = 1;
		
		public function MoveABX(loc1:Point, loc2:Point, body:b2Body, speed:Number = 0.02, angle:Number = 0) {
			this.speed = speed;
			this.angle = angle;
			point1 = loc1.clone();
			point2 = loc2.clone();
			setVelocities();
			super(body);
		}
		
		private function setVelocities():void {
			if (point1.x == point2.x) {
				if (point1.y > point2.y) {
					vel1 = new b2Vec2(0, -speed);
				} else if (point1.y < point2.y) {
					vel1 = new b2Vec2(0, speed);
				}
			} else if (point1.x > point2.x) {
				if (point1.y == point2.y) {
					vel1 = new b2Vec2(-speed, 0);
				} else
					vel1 = new b2Vec2(speed * Math.cos(Math.atan((point1.y - point2.y) / (point1.x - point2.x))), 
									  speed * Math.sin(Math.atan((point1.y - point2.y) / (point1.x - point2.x))));
			} else if (point1.x < point2.x) {
				if (point1.y == point2.y) {
					vel1 = new b2Vec2(speed, 0);
				} else
					vel1 = new b2Vec2(speed * Math.cos(Math.atan((point2.y - point1.y) / (point2.x - point1.x))), 
									  speed * Math.sin(Math.atan((point2.y - point1.y) / (point2.x - point1.x))));
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
		
		private function setLoc(vel:b2Vec2):void {
			var loc:b2Vec2 = body.GetPosition().Copy();
			loc.Add(vel);
			body.SetXForm(loc, body.GetAngle());
		}
		
		override public function update():void {
			if (point2 != null) {
				var center:b2Vec2 = body.GetWorldCenter().Copy();
				center.Multiply(PhysicalWorld.RATIO);
				findDirection(center);
				if (direction == 1) {
					setLoc(vel1);
				} else if (direction == -1) {
					setLoc(vel2);
				}
			}
			super.update();
		}
	}
}