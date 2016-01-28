package {
	import Box2D.Collision.b2AABB;
	import Box2D.Collision.Shapes.b2CircleShape;
	import Box2D.Collision.Shapes.b2PolygonShape;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Common.Math.b2XForm;
	import Box2D.Dynamics.b2Body;
	import flash.events.MouseEvent;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Bazooka extends Gun {
		public function Bazooka() {
			super("bazookaHands");
			Platformer.instance.stage.addEventListener(MouseEvent.CLICK, shoot);
		}
		
		private function check(e:MouseEvent):void {
			var x:Number = (e.stageX - CameraManager.pLayer.x) / 72;
			var y:Number = (e.stageY - CameraManager.pLayer.y) / 72;
			var x1:Number = (e.stageX - CameraManager.pLayer.x)/108;
			var y1:Number = (e.stageY - CameraManager.pLayer.y)/108;
			
			trace("X");
			trace((e.stageX - CameraManager.pLayer.x));
			trace("Y");
			trace((e.stageY - CameraManager.pLayer.y));
			
			
			//x *= 1.25;
			//y *= 1.25;
			
			//var p:b2Vec2 = new b2Vec2(x1, y1);
			var callback:Array = [];
			var aabb:b2AABB = new b2AABB();
			aabb.lowerBound.Set(x1, y1);
			aabb.upperBound.Set(x1, y1);
			PhysicalWorld.world.Query(aabb, callback, 1);
			if (callback.length) {
				if (callback[0] is b2PolygonShape) {
					var ud = b2PolygonShape(callback[0]).GetBody().GetUserData();
					if (ud is Standard) {
						trace("body");
						Standard(ud).bodyTrace();
						trace("x");
						trace(x + " " + y);
						trace("x1");
						trace(x1 + " " + y1);
						//Standard(ud).remove();
					}
				}
			} else {
				new Standard(x, y, 1, 1);
			}
		}
		
		private function build(e:MouseEvent):void {
			var x:Number = (e.stageX - CameraManager.pLayer.x) / 60;
			var y:Number = (e.stageY - CameraManager.pLayer.y) / 60;
			new Standard(x, y, 1, 1);
		}
		
		private function shoot(e:MouseEvent):void {
			var x:Number = (e.stageX - CameraManager.pLayer.x) / 108;
			var y:Number = (e.stageY - CameraManager.pLayer.y) / 108;
			var px:Number = Platformer.player.getBody().GetWorldCenter().x;
			var py:Number = Platformer.player.getBody().GetWorldCenter().y;
			//trace(x + " " + px + " " + y + " " + py);
			var angle:Number = Math.PI / 2 - Math.atan2(x - px, y - py);
			var ox:Number = Math.cos(angle) / 2;
			var oy:Number = Math.sin(angle) / 2;
			var bullet:Bullet = new Bullet(px + ox, py + oy, 5);
			bullet.applyImpulse(ox * 10, oy * 10);
		}
		
		private function click(e:MouseEvent):void {
			var x:Number = (e.stageX - CameraManager.pLayer.x) / 60;
			var y:Number = (e.stageY - CameraManager.pLayer.y) / 60;
			new DummyCircle(x, y, Math.random() * 30 + 10);
		}
		
		override protected function cleanUpBeforeRemoving():void {
			Platformer.instance.stage.removeEventListener(MouseEvent.CLICK, shoot);//не забывать убирать используемую функцию
			super.cleanUpBeforeRemoving();
		}
	}
}