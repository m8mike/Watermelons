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
	public class SnowGun extends Gun {
		
		public function SnowGun() {
			super("bazookaSnowHands");
			Platformer.instance.stage.addEventListener(MouseEvent.CLICK, check);
		}
		
		private function check(e:MouseEvent):void {
			var x:Number = (e.stageX - CameraManager.pLayer.x) / 90;
			var y:Number = (e.stageY - CameraManager.pLayer.y) / 90;
			var x1:Number = (e.stageX - CameraManager.pLayer.x) / 60;
			var y1:Number = (e.stageY - CameraManager.pLayer.y) / 60;
			//var p:b2Vec2 = new b2Vec2(x, y);
			var callback:Array = [];
			var aabb:b2AABB = new b2AABB();
			aabb.lowerBound.Set(x, y);
			aabb.upperBound.Set(x, y);
			PhysicalWorld.world.Query(aabb, callback, 1);
			if (callback.length) {
				if (callback[0] is b2PolygonShape) {
					var ud = b2PolygonShape(callback[0]).GetBody().GetUserData();
					if (ud is JumpThrough) {
						JumpThrough(ud).remove();
					}
				}
			} else {
				new JumpThrough(x1, y1, 3, 0.1);
			}
		}
		
		private function build(e:MouseEvent):void {
			var x:Number = (e.stageX - CameraManager.pLayer.x) / 60;
			var y:Number = (e.stageY - CameraManager.pLayer.y) / 60;
			new Standard(x, y, 1, 1);
		}
		
		private function shoot(e:MouseEvent):void {
			var x:Number = (e.stageX - CameraManager.pLayer.x) / 60;
			var y:Number = (e.stageY - CameraManager.pLayer.y) / 60;
			new DummyCircle(x, y, 5);
		}
		
		private function click(e:MouseEvent):void {
			var x:Number = (e.stageX - CameraManager.pLayer.x) / 60;
			var y:Number = (e.stageY - CameraManager.pLayer.y) / 60;
			new DummyCircle(x, y, Math.random() * 30 + 10);
		}
		
		override protected function cleanUpBeforeRemoving():void {
			Platformer.instance.stage.removeEventListener(MouseEvent.CLICK, check);
			super.cleanUpBeforeRemoving();
		}
	}
}