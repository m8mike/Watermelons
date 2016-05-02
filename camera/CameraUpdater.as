package {
	import Box2D.Common.Math.b2Vec2;
	import flash.geom.Point;
	
	/**
	* вычисление позиции камеры
	* @author Mad Mike
	*/
	public class CameraUpdater {
		private static var camKoef:Number = 1;
		private static var camKoef2:Number = 1;
		private static var previousVelocities:Array = [];
		
		public static function getCameraSection():Point {
			if (Platformer.player) {
				var lastLoc:Point = getOnePlayerSection();
				CameraManager.freePoint = lastLoc.clone();
				return lastLoc;
			} else {
				return CameraManager.freePoint;
			}
		}
		
		public static function getOnePlayerSection():Point {
			if (Platformer.player.getBody() == null) {
				return Platformer.player.getSpriteLoc();
			}
			var spriteLoc:Point = Platformer.player.getSpriteLoc();
			var goldenSection:Point;
			var goldenY:Number = spriteLoc.y - 18.144;
			var lastY:Number;
			var currentY:Number;
			var middleY:Number;
			if (Platformer.player.condition.canJump) {
				if (currentY != goldenY) {
					lastY = goldenY;
					currentY = goldenY;
					camKoef2 = 1;
				} else {
					if (lastY < goldenY) {
						lastY += Math.abs(lastY - goldenY) * camKoef2;
					} else {
						lastY -= Math.abs(lastY - goldenY) * camKoef2;
					}
					if (camKoef2 > 0.02) {
						camKoef2 -= 0.01;
					} else {
						camKoef2 = 0;
					}
				}
				middleY = goldenY + Math.abs(lastY - goldenY) * camKoef;
			} else {
				if (lastY < goldenY) {
					lastY += Math.abs(lastY - goldenY) * camKoef2;
				} else {
					lastY -= Math.abs(lastY - goldenY) * camKoef2;
				}
				if (camKoef2 > 0.02) {
					camKoef2 -= 0.001;
				} else {
					camKoef2 = 0;
				}
				middleY = goldenY + Math.abs(currentY - goldenY) * camKoef;
			}
			goldenSection = new Point(spriteLoc.x, middleY);
			for (var i:int = 5; i > 0; i--) {
				if (previousVelocities[i - 1]) {
					previousVelocities[i] = b2Vec2(previousVelocities[i - 1]).Copy();
				}
			}
			previousVelocities[0] = Platformer.player.getBody().GetLinearVelocity().Copy();
			var previous:Point = new Point(0, 0);
			for each(var vel:b2Vec2 in previousVelocities) {
				previous.x += vel.x;
				previous.y += vel.y;
			}
			var purpleSection:Point = new Point(
				spriteLoc.x, 
				spriteLoc.y - previous.y / 3);
			var percentage:Number = 0.5;
			if (Platformer.player.getBody().GetLinearVelocity().y >= 0) {
				percentage *= 0.9;
			} else {
				if (percentage < 0.999) {
					percentage *= 1.1;
				}
			}
			purpleSection.y  -= 18.144;
			return purpleSection;
		}
		
		public static function camKoefRed():void {
			if (Platformer.player) {	
				if (Platformer.player.getBody().GetLinearVelocity().y <= 0) {
					camKoef = 1;
				} else {
					if (camKoef > 0.0001) {
						camKoef *= 0.97;
					}
				}
			}
		}
	}
}