package {
	
	/**
	 * ...
	 * @author ...
	 */
	public class BombCostumeManager {
		private var bombOff:AnimationCostume;
		private var bombOn:AnimationCostume;
		private var currentCostume:Costume;
		private var costumes:Array = [];
		
		private var parent:Bomb;
		
		public function BombCostumeManager(bomb:Bomb) {
			parent = bomb;
			createCostumes();
			changeAnimation(bombOff);
		}
		
		public function update():void {
			setCoords();
			checkCondition();
		}
		
		private function checkCondition():void {
			if (parent.started) {
				changeCondition(bombOn);
			}
		}
		
		private function changeCondition(cond:Costume):void {
			if (currentCostume != cond) {
				changeAnimation(cond);
			}
		}
		
		private function createCostumes():void {
			var camera:Camera = CameraManager.camera;
			costumes.push(bombOff = new AnimationCostume("pumpkin_bomb", camera));
			costumes.push(bombOn = new AnimationCostume("pumpkin_bomb_on", camera));
			for each (var costume:AnimationCostume in costumes) {
				costume.setScale(0.1);
			}
		}
		
		private function setCoords():void {
			var x:Number = parent.getBody().GetPosition().x * PhysicalWorld.RATIO;
			var y:Number = parent.getBody().GetPosition().y * PhysicalWorld.RATIO;
			currentCostume.setLocation(x, y);
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
		
		public function destroy():void {
			for each (var costume:Costume in costumes) {
				costume.remove();
			}
		}
	}
}