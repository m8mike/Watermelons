package {
	
	/**
	 * ...
	 * @author ...
	 */
	public class GhostCostumeManager {
		private var flyLeft:AnimationCostume;
		private var flyRight:AnimationCostume;
		private var flyStop:AnimationCostume;
		private var currentCostume:Costume;
		private var costumes:Array = [];
		
		private var parent:Ghost;
		
		public function GhostCostumeManager(ghost:Ghost) {
			parent = ghost;
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
			costumes.push(flyLeft = new AnimationCostume("ghost1", camera));
			costumes.push(flyRight = new AnimationCostume("ghost1", camera));
			costumes.push(flyStop = new AnimationCostume("ghost1", camera));
			for each (var costume:AnimationCostume in costumes) {
				costume.setScale(0.35);
				costume.animation.bitmap.alpha = 0.8;
			}
			flyLeft.flipRight(false);
		}
		
		private function setCoords():void {
			var x:Number = parent.getBody().GetPosition().x * PhysicalWorld.RATIO;
			var y:Number = parent.getBody().GetPosition().y * PhysicalWorld.RATIO;
			if (currentCostume == flyLeft) {
				currentCostume.setLocation(x + 72 * 0.5, y - 5);
			} else {
				currentCostume.setLocation(x, y - 5);
			}
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