package {
	import Box2D.Common.Math.b2Vec2;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Ghost extends Character {
		private var move:MoveAB;
		//private var follow:Follow;
		private var size:b2Vec2;
		//private var costumeManager:GhostCostumeManager;
		
		public function Ghost(x:int, y:int) {
			bodyManager = new GhostBodyManager(new Point(x * 20, y * 20), this);
			condition = new Condition();
			super(x, y);
			
			var loc1:Point = location.clone();
			loc1.x += 200;
			move = new MoveAB(location, loc1, bodyManager.body);
			//follow = new Follow(getBody(), Platformer.player.getBody());
			//costumeManager = new GhostCostumeManager(this);
		}
		
		override public function update():void {
			move.update();
			//costumeManager.update();
			super.update();
		}
	}
}