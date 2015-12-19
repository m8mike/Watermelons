package {
	
	/**
	 * ...
	 * @author ...
	 */
	public class BatCostumeManager {
		private var flyLeft:AnimationCostume;
		private var flyRight:AnimationCostume;
		private var flyStop:AnimationCostume;
		private var currentCostume:Costume;
		private var costumes:Array = [];
		
		private var parent:Bat;
		
		public function BatCostumeManager(bat:Bat) {
			parent = bat;
			createCostumes();
			changeAnimation(flyStop);
		}
		
		public function update():void {
			setCoords();
			checkCondition();
		}
		
		private function checkCondition():void {
			var velX:Number = parent.getBody().GetLinearVelocity().x;
			if (velX > 0.1) {
				changeCondition(flyRight);
			} else if (velX < -0.1) {
				changeCondition(flyLeft);
			} else {
				changeCondition(flyStop);
			}
		}
		
		private function changeCondition(cond:Costume):void {
			if (currentCostume != cond) {
				changeAnimation(cond);
			}
		}
		
		private function createCostumes():void {
			var camera:Camera = CameraManager.camera;
			costumes.push(flyLeft = new AnimationCostume("bat_left", camera));
			costumes.push(flyRight = new AnimationCostume("bat_right", camera));
			costumes.push(flyStop = new AnimationCostume("bat_straight", camera));
			for each (var costume:AnimationCostume in costumes) {
				costume.setScale(0.1);
			}
		}
		
		private function setCoords():void {
			var x:Number = parent.getBody().GetPosition().x * PhysicalWorld.RATIO;
			var y:Number = parent.getBody().GetPosition().y * PhysicalWorld.RATIO;
			currentCostume.setLocation(x, y - 5);
		}
		
		private function changeAnimation(cond:Costume):void {
			hideCostumes();
			if (currentCostume) {	
				currentCostume.stop();
			}
			currentCostume = cond;
			setCoords();
			currentCostume.play();
		}
		
		private function hideCostumes():void {
			for each (var s:Costume in costumes) {
				s.hide();
			}
		}
	}
}