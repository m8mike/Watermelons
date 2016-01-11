package {
	import Box2D.Dynamics.b2Body;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Character extends Actor {
		protected var bodyManager:BodyManager;
		public var loc2Spawn:Point;
		public var condition:Condition;
		
		public function Character(x:Number, y:Number) {
			Updatables.addCharacter(this);
			loc2Spawn = new Point(x, y);
			var loc:Point = new Point(x * PhysicalWorld.MIN_SQARE, y * PhysicalWorld.MIN_SQARE);
			super(loc);
		}
		
		public function getBody():b2Body {
			if (bodyManager.removed) {
				return null;
			}
			return bodyManager.body;
		}
		
		override public function update():void {
			if (bodyManager) {
				bodyManager.update();
			}
			super.update();
		}
		
		public function initBody():void {
			
		}
		
		override protected function cleanUpBeforeRemoving():void {
			Updatables.removeCharacter(this);
			super.cleanUpBeforeRemoving();
		}
		
		override protected function removeBodies():void {
			bodyManager.removeBodies();
		}
	}
}