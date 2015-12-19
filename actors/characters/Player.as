package {
	import Box2D.Common.Math.b2Vec2;
	import flash.geom.Point;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class Player extends Character {
		public var invincibilityTime:int = 0;
		private var invincibilityKoef:Number = 2;
		//private var costumeManager:PlayerCostumeManager;
		
		public var currentItem:Item;
		
		public function Player(x:int, y:int) {
			condition = new Condition();
			bodyManager = new PlayerBodyManager(new Point(x * 20, y * 20), this);
			//costumeManager = new PlayerCostumeManager(this);
			super(x, y);
		}
		
		override protected function cleanUpBeforeRemoving():void {
			if (Platformer.player == this) {
				Platformer.player = null;
			}
			super.cleanUpBeforeRemoving();
		}
		
		override public function getSpriteLoc():Point {
			var worldCenter:b2Vec2 = getBody().GetWorldCenter().Copy();
			return new Point(worldCenter.x * PhysicalWorld.RATIO,
							 worldCenter.y * PhysicalWorld.RATIO);
		}
		
		public function clearJumps():void {
			PlayerBodyManager(bodyManager).jump.jumpIterations = 0;
		}
		
		override public function update():void {
			if (currentItem) {
				currentItem.update();
			}
			/*if (costumeManager) {
				costumeManager.update();
			}*/
			super.update();
		}
		
		public function itemGet(id:Class):void {
			if (currentItem) {
				if (!(currentItem is id)) {
					currentItem.remove();
					currentItem = new (id)(this);
				} else {
					currentItem.pickAnother();
				}
			} else {
				currentItem = new (id)(this);
			}
		}
		
		public function itemRemove():void {
			if (currentItem) {
				currentItem.remove();
				currentItem = null;
			}
		}
		
		public function changeHat(index:int):void {
			
		}
		
		public function hit():void {
			//spikes
		}
		
		public function jumpOnHead():void {
			getBody().SetLinearVelocity(new b2Vec2(0, -5));
			//getBody().ApplyImpulse(new b2Vec2(0, -0.7), getBody().GetWorldCenter());
		}
		
		public function spawn(loc:Point):void {
			bodyManager = new PlayerBodyManager(loc, this);
		}
	}
}