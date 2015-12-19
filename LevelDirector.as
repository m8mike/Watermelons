package {
	import flash.geom.Point;
	
	public class LevelDirector {
		
		public function LevelDirector() {
			SoundMusic.setSoundVolume(1);
			new Standard(0, 0, 35, 2);
			//new CannonLazyFixedRotation(10, -5);
			///new CannonLazy(15, -5);
			/*new Cannon(20, -5);
			new CannonFixed(25, -5);
			new CannonFixedRotation(30, -5);
			new CannonMoving(30, -15, new Point(50, -15), -90);*/
			//new CannonFixed(10, -5);
			//new CannonCircleMoving(10, -5, 3, 0);
			/*new CannonFollowing(10, -5, new Point(20, -5));
			new CannonFollowing(35, -10, new Point(35, -5));
			new CannonFollowing(0, 0, new Point(100, -100));
			new CannonFollowing(20, -10, new Point(30, -5));*/
			//new CannonMovingFollowing(10, -5, new Point(30, -5));
			//new CannonRotating(10, -5, 90, -2);
			//new CannonMovingRotating(13, -3, new Point(18, -3), -90);
			//new CannonMoving(13, -3, new Point(18, -3), -90);
			//new StandardMoving(20, -3, new Point(20, -7), 3, 1);
			//new BombingBat(10, -6);
			//new Polyp(10, -1);
			//new SpringBush(14, -1);
			//new BubbleUpBonus(10, -2);
			//new SpringsBonus(15, -2);
			//new DeltaplanBonus(10, -15);
			/*new Dummy(10, -2);
			new DummyCircle(14, -2);*/
			//new TopHatEnd(10, 0);
			//new Cloud(7, -7);
			/*new UmbrellaBonus(8, -5);
			new JetpackBonus(12, -5);*/
			/*new Bat(10, -6);
			new Ghost(5, -3);
			new Bomb(12, -3);
			new Zombie(18, -2);
			new Werewolf(15, -5);*/
			/*new Bomb(13, -3);
			new Bomb(14, -3);
			new Bomb(15, -3);
			new Bomb(16, -3);
			new Bomb(13, -4);
			new Bomb(14, -4);
			new Bomb(15, -4);
			new Bomb(14, -5);*/
			//var hex:StickyHexagon = new StickyHexagon(10, -4, 2);
			//new TestPlatform(hex.getBody(), 10, -8, 3, 1);
			/*new StickyHexagon(10+2*Math.sqrt(3), -4, 2);
			new StickyHexagon(10+6*Math.sqrt(3), -4, 2);
			new StickyHexagon(10+6*Math.sqrt(3), -10, 2);
			new StickyHexagon(10+7*Math.sqrt(3), -7, 2);
			new StickyHexagon(10 + Math.sqrt(3), -7, 2);
			
			for (var i:int = 0; i < 500; i++) {
				new StickyHexagon(10+(2*i+8)*Math.sqrt(3), -4, 2);
			}*/
			//new ControlCabin(new CannonRotating(10, -4, 90, 2), 10, -1);
			//addBoxWalls();
			//new HotAirBalloon(10, -6);
			//new Car(10, -6);
			//new Funicular(10, -10, new Point(20, -12));
			new DynamicTerrain(0, 0);
		}
		
		private function addBoxWalls():void {
			new Gummy(-2, -14, 2, 15);
			new Gummy(25, -14, 2, 15);
		}
		
		private function addWalls():void {
			new Gummy(-2, -14, 2, 15);
			new Gummy(5, -14, 2, 15);
			new Sticky(12, -14, 2, 15);
			new Sticky(19, -14, 2, 15);
			new Standard(26, -14, 2, 15);
			new Standard(33, -14, 2, 15);
		}
		
		private function addStickyBalls():void {
			new SpringBall(12, -1);
			new SpringBall(8, -1);
			new SpringBall(10, -4);
			new SpringBall(6, -4);
			new SpringBall(4, -1);
			new SpringBall(2, -4);
			new SpringBall(12, -7);
			new SpringBall(8, -7);
			new SpringBall(10, -10);
			new SpringBall(6, -10);
			new SpringBall(4, -7);
			new SpringBall(2, -10);
		}
	}
}