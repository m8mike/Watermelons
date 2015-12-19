package {
	
	/**
	 * ...
	 * @author ...
	 */
	public class WerewolfCostumeManager {
		private var stay:AnimationCostume;
		private var stand:AnimationCostume;
		private var sit:AnimationCostume;
		private var jump:AnimationCostume;
		private var currentCostume:Costume;
		private var costumes:Array = [];
		
		private var parent:Werewolf;
		
		public function WerewolfCostumeManager(werewolf:Werewolf) {
			parent = werewolf;
			createCostumes();
			changeAnimation(stay);
		}
		
		public function update():void {
			setCoords();
			checkCondition();
		}
		
		private function checkCondition():void {
			if (parent.jump.timeToJump < 10 && parent.condition.canJump) {
				changeCondition(sit);
				return void;
			}
			var velY:Number = parent.getBody().GetLinearVelocity().y;
			if (parent.condition.canJump) {
				changeCondition(stand);
			} else if (velY < -2) {
				changeCondition(jump);
			}
		}
		
		private function changeCondition(cond:Costume):void {
			if (currentCostume != cond) {
				changeAnimation(cond);
			}
		}
		
		private function createCostumes():void {
			var camera:Camera = CameraManager.camera;
			costumes.push(stay = new AnimationCostume("werewolf_stay", camera));
			costumes.push(stand = new AnimationCostume("werewolf_stand", camera));
			costumes.push(sit = new AnimationCostume("werewolf_sit", camera));
			costumes.push(jump = new AnimationCostume("werewolf_jump", camera));
			jump.animation.onEnd = jump.stop;
			sit.animation.onEnd = sit.stop;
			stand.animation.onEnd = stand.stop;
			for each (var costume:AnimationCostume in costumes) {
				costume.setScale(0.1);
			}
		}
		
		private function setCoords():void {
			var x:Number = parent.getBody().GetPosition().x * PhysicalWorld.RATIO;
			var y:Number = parent.getBody().GetPosition().y * PhysicalWorld.RATIO;
			if (currentCostume == stand) {
				currentCostume.setLocation(x, y - 17);
			} else if (currentCostume == jump) {
				currentCostume.setLocation(x, y - 10);
			} else {
				currentCostume.setLocation(x, y);
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