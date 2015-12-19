package {
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Item {
		protected var player:Player;
		
		public function Item(player:Player) {
			this.player = player;
		}
		
		public function update():void {
			
		}
		
		public function remove():void {
			
		}
		
		public function pickAnother():void {
			
		}
		
		/*public static function addRandomItem(x:Number, y:Number):void {
			var randomNumber:int = Math.random() * 5;
			switch (randomNumber) {
				case 0:
					new JetpackBonus(x, y);
					//new SnowGunBonus(x, y);
				break;
				case 1:
					new JetpackBonus(x, y);
				break;
				case 2:
					//new UmbrellaBonus(x, y);
					new BazookaBonus(x, y);
				break;
				case 3:
					new UmbrellaBonus(x, y);
				break;
				default:
				new BubbleBonus(x, y);
			}
		}*/
	}
}