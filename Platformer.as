package {
	import Box2D.Dynamics.b2Body;
	import fl.motion.Color;
	import flash.display.MovieClip;
	import flash.events.Event;
	
	/**
	* игра про арбуз
	* а точнее её физическая часть
	* это значит здесь нет графики
	* только box2D
	* @author Mad Mike
	*/
	public class Platformer extends MovieClip {
		public static var instance:Platformer;
		public static var player:Player;
		
		public function Platformer() {
			instance = this;
			CameraManager.init();
			PhysicalWorld.setupPhysicsWorld();
			PhysicalWorld.setupDebugDraw();
			new LevelDirector();
			instance.addEventListener(Event.ENTER_FRAME, gameCycle);
			player = new Player(5, -5);
			new Controls();
		}
		
		private static function gameCycle(e:Event):void {
			PhysicalWorld.update();
			CameraManager.update();
			Updatables.updateAll();
			if (Controls.zoom) {
				CameraManager.zoomRatio *= 1.1;
			} else if (Controls.unzoom) {
				CameraManager.zoomRatio /= 1.1;
			}
			/*if (player) {
				return void;
			}
			if (Controls.up) {
				CameraManager.freePoint.y -= 10 / CameraManager.zoomRatio;
			} else if (Controls.down) {
				CameraManager.freePoint.y += 10 / CameraManager.zoomRatio;
			} else if (Controls.left) {
				CameraManager.freePoint.x -= 10 / CameraManager.zoomRatio;
			} else if (Controls.right) {
				CameraManager.freePoint.x += 10 / CameraManager.zoomRatio;
			}*/
		}
	}
}