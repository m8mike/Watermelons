package {
	import Box2D.Common.Math.b2Vec2;
	import flash.display.DisplayObjectContainer;
	import flash.geom.Point;
	import flash.text.TextField;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class PlayerCostumeManager {
		private  var costumes:Array = [];
		public var currentCostume:Costume;
		private var visible:Boolean = true;
		private var animStopped:Boolean = false;
		
		private var parent:Player;
		
		private var stayRight:CharacterAnimation;
		private var stayLeft:CharacterAnimation;
		private var goRight:CharacterAnimation;
		private var goLeft:CharacterAnimation;
		private var jumpRight:CharacterAnimation;
		private var jumpLeft:CharacterAnimation;
		private var fallRight:CharacterAnimation;
		private var fallLeft:CharacterAnimation;
		private var walljumpRight:CharacterAnimation;
		private var walljumpLeft:CharacterAnimation;
		private var umbrellaRight:CharacterAnimation;
		private var umbrellaLeft:CharacterAnimation;
		private var umbrellaGoRight:CharacterAnimation;
		private var umbrellaGoLeft:CharacterAnimation;
		
		public function PlayerCostumeManager(player:Player) {
			parent = player;
			createCostumes();
			changeCondition(stayRight);
			show();
		}
		
		private function stopAnim():void {
			animStopped = true;
			currentCostume.stop();
		}
		
		private function checkCondition():void {
			var xVel:Number = parent.getBody().GetLinearVelocity().x;
			var speedIsSmall:Boolean = Math.abs(xVel) <= 0.05;
			var condition:Condition = parent.condition;
			if (condition.sleeping) {
				changeCondition(stayRight, stayLeft);
			} else if (condition.canJump) {
				if (speedIsSmall) {
					changeCondition(stayRight, stayLeft);
				} else {
					changeCondition(goRight, goLeft);
				}
			} else {
				if (condition.falling) {
					var jumping:Boolean = (currentCostume == jumpLeft) || (currentCostume == jumpRight) ||
											(currentCostume == walljumpLeft) || (currentCostume == walljumpRight);
					if (animStopped && jumping && !condition.rightWallJump && !condition.leftWallJump) {
						changeCondition(fallRight, fallLeft);
						animStopped = false;
					} else if (condition.leftWallJump) {
						changeCondition(walljumpLeft);
						stopAnim();
					} else if (condition.rightWallJump && condition.falling) {
						changeCondition(walljumpRight);
						stopAnim();
					}
				} else {
					if (condition.wallJumped && !condition.rightWallJump && !condition.leftWallJump) {
						changeCondition(walljumpRight, walljumpLeft);
						currentCostume.play();
						animStopped = false;
						condition.wallJumped = false;
					} else if ((currentCostume != walljumpLeft) && (currentCostume != walljumpRight) && !condition.wallJumped) {
						changeCondition(jumpRight, jumpLeft);
					}
				}
			}
		}
		
		public function update():void {
			CameraUpdater.camKoefRed();
			setCoords();
			checkCondition();
		}
		
		private function createCostumes():void {
			var camera:DisplayObjectContainer = CameraManager.camera;
			costumes.push(stayRight = new CharacterAnimation(new stay_char(), camera));
			costumes.push(stayLeft = new CharacterAnimation(new stay_char(), camera));
			costumes.push(goRight = new CharacterAnimation(new go_char(), camera));
			costumes.push(goLeft = new CharacterAnimation(new go_char(), camera));
			costumes.push(jumpRight = new CharacterAnimation(new jump_char(), camera));
			costumes.push(jumpLeft = new CharacterAnimation(new jump_char(), camera));
			costumes.push(fallRight = new CharacterAnimation(new fall_char(), camera));
			costumes.push(fallLeft = new CharacterAnimation(new fall_char(), camera));
			costumes.push(walljumpRight = new CharacterAnimation(new walljump_char(), camera));
			costumes.push(walljumpLeft = new CharacterAnimation(new walljump_char(), camera));
			costumes.push(umbrellaRight = new CharacterAnimation(new fall_char(), camera));
			costumes.push(umbrellaLeft = new CharacterAnimation(new fall_char(), camera));
			costumes.push(umbrellaGoRight = new CharacterAnimation(new go_char(), camera));
			costumes.push(umbrellaGoLeft = new CharacterAnimation(new go_char(), camera));
			goRight.startFrame = 16;
			goLeft.startFrame = 16;
			umbrellaGoRight.startFrame = 16;
			umbrellaGoLeft.startFrame = 16;
			jumpRight.setOnEnd(stopAnim);
			jumpLeft.setOnEnd(stopAnim);
			walljumpRight.setOnEnd(stopAnim);
			walljumpLeft.setOnEnd(stopAnim);
			fallLeft.setOnEnd(stopAnim);
			fallRight.setOnEnd(stopAnim);
			
			for (var i:int = 0; i < costumes.length; i++) {
				var loc:Point = new Point();
				var costume:CharacterAnimation = costumes[i];
				costume.setScale(0.4);
				loc.x = (i - (i % 2)) * 40;
				if (i % 2) {
					loc.x += 120;
					loc.y = 200;
					costume.flipRight(false);
				}
				costume.setLocation(loc.x, loc.y);
				costume.changeHands(0, 0);
			}
			umbrellaRight.changeHands(0, 2);
			umbrellaLeft.changeHands(2, 0);
			umbrellaGoRight.changeHands(0, 2);
			umbrellaGoLeft.changeHands(2, 0);
		}
		
		private function changeCondition(condRight:Costume, condLeft:Costume = null):void {
			var directionRight:Boolean = parent.condition.directionRight;
			var stopped:Boolean = parent.condition.stopped;
			var onGround:Boolean = parent.condition.canJump;
			var left:Boolean = Boolean(costumes.indexOf(currentCostume) % 2);
			if (!condLeft) {
				if (currentCostume != condRight) {
					changeAnimation(condRight);
				}
			} else if (stopped && onGround) {
				if (left) {
					changeAnimation(condLeft);
				} else {
					changeAnimation(condRight);
				}
			} else if ((currentCostume != condRight) && directionRight) {
				changeAnimation(condRight);
			} else if ((currentCostume != condLeft) && !directionRight) {
				changeAnimation(condLeft);
			}
		}
		
		private function setCoords():void {
			var x:Number = parent.getBody().GetPosition().x * PhysicalWorld.RATIO - 23;
			var xLeft:Number = parent.getBody().GetPosition().x * PhysicalWorld.RATIO + 23;
			var y:Number = parent.getBody().GetPosition().y * PhysicalWorld.RATIO - 45;
			if (costumes.indexOf(currentCostume) % 2) {
				currentCostume.setLocation(xLeft, y);
			} else {
				currentCostume.setLocation(x, y);
			}
		}
		
		private function changeAnimation(cond:Costume):void {
			if (currentCostume) {
				if (currentCostume == cond) {
					return void;
				}
				currentCostume.stop();
			}
			hideCostumes();
			currentCostume = cond;
			setCoords();
			if (visible) {
				currentCostume.play();
			}
		}
		
		private function hideCostumes():void {
			for each (var s:Costume in costumes) {
				s.hide();
			}
		}
		
		public function hide():void {
			if (visible) {	
				visible = false;
				hideCostumes();
			}
		}
		
		public function show():void {
			if (!visible) {
				visible = true;
				currentCostume.show();
			}
		}
		
		public function removeCostumes():void {
			while (costumes.length > 0) {
				Costume(costumes[0]).remove();
				costumes.splice(0, 1);
			}
		}
		
		public function conditionIsUmbrella():Boolean {
			if (currentCostume == umbrellaGoLeft || currentCostume == umbrellaGoRight || 
				currentCostume == umbrellaLeft || currentCostume == umbrellaRight) {
				return true;	
			}
			return false;
		}
	}
}