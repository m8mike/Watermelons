package {
	import flash.display.MovieClip;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Inventory extends Decor {
		public var _lifes:Array = [];
		public var _keys:Array = [];
		public var diamondCount:int = 0;
		
		public static const MAX_LIFES:int = 5;
		public static const MAX_KEYS:int = 3;
		
		private var diamondIcon:AnimationCostume;
		private var diamondText:TextField;
		
		private var jetpackText:TextField;
		private var jetpackShadow:TextField;
		
		private static var instance:Inventory;
		
		public function Inventory() {
			
		}
		
		public static function getInstance():Inventory {
			if (instance) {
				return instance;
			} else {
				instance = new Inventory();
				return instance;
			}
		}
		
		public function addDiamond():void {
			diamondCount++;
			if (!diamondIcon) {
				diamondIcon = new AnimationCostume("diamond_bonus", CameraManager.inventory);
				diamondIcon.setScale(0.5);
				diamondIcon.setLocation(50, 50);
				diamondIcon.show();
				diamondText = new TextField();
				diamondText.x = 80;
				diamondText.y = 40;
				diamondText.visible = true;
				diamondText.selectable = false;
				diamondText.text = "x " + diamondCount.toString();
				//var mytf:TextFormat = new TextFormat("Zorque-Regular");
				var mytf:TextFormat = new TextFormat("Arial");
				mytf.bold = true;
				mytf.size = 22;
				diamondText.setTextFormat(mytf);
				diamondText.defaultTextFormat = mytf;
				diamondText.width = 200;
				diamondText.height = 60;
				diamondText.textColor = 0x004080;
				CameraManager.inventory.addChild(diamondText);
			} else {
				diamondText.text = "x " + diamondCount.toString();
			}
		}
		
		public function addLife():void {
			if (_lifes.length < MAX_LIFES) {
				var hpHeart:MovieClip = new heart();
				hpHeart.x = 60 + _lifes.length * 40;
				hpHeart.y = 420;
				hpHeart.scaleX = 0.5;
				hpHeart.scaleY = 0.5;
				CameraManager.inventory.addChild(hpHeart);
				_lifes.push(hpHeart);
			}
		}
		
		public function removeLife():void {
			if (_lifes.length > 0) {
				var i:int = _lifes.length - 1;
				var heartHP:MovieClip = _lifes[i];
				heartHP.parent.removeChild(heartHP);
				_lifes.splice(i, 1);
			}
		}
		
		public function addKey():void {
			if (_keys.length < MAX_KEYS) {
				var key:MovieClip = new key1();
				key.x = 500 + _keys.length * 40;
				key.y = 40;
				key.scaleX = 0.5;
				key.scaleY = 0.5;
				CameraManager.inventory.addChild(key);
				_keys.push(key);
			}
		}
		
		public function removeKey():void {
			if (_keys.length > 0) {
				for (var i:int = CameraManager.inventory.numChildren - 1; i > 0; i--) {
					if (CameraManager.inventory.getChildAt(i) is key1) {
						CameraManager.inventory.removeChildAt(i);
						break;
					}
				}
				_keys.splice(_keys.length - 1, 1);
			}
		}
		
		public function addJetpackTime():void {
			if (jetpackText) {
				jetpackText.visible = true;
				jetpackShadow.visible = true;
				return void;
			}
			jetpackText = new TextField();
			jetpackText.x = 400;
			jetpackText.y = 10;
			jetpackText.visible = true;
			jetpackText.selectable = false;
			jetpackText.text = "Jetpack: 100";
			//var mytf:TextFormat = new TextFormat("Zorque-Regular");
			var mytf:TextFormat = new TextFormat();
			var fk:Font = new Kavoon();
			mytf.font = fk.fontName;
			mytf.bold = true;
			mytf.size = 22;
			jetpackText.setTextFormat(mytf);
			jetpackText.defaultTextFormat = mytf;
			jetpackText.embedFonts = true;
			jetpackText.width = 200;
			jetpackText.height = 60;
			jetpackText.textColor = 0xFFFFFF;
			jetpackShadow = new TextField();
			jetpackShadow.x = 403;
			jetpackShadow.y = 13;
			jetpackShadow.visible = true;
			jetpackShadow.selectable = false;
			jetpackShadow.text = "Jetpack: 100";
			jetpackShadow.setTextFormat(mytf);
			jetpackShadow.defaultTextFormat = mytf;
			jetpackShadow.embedFonts = true;
			jetpackShadow.width = 200;
			jetpackShadow.height = 60;
			jetpackShadow.textColor = 0x000000;
			CameraManager.inventory.addChild(jetpackShadow);
			CameraManager.inventory.addChild(jetpackText);
		}
		
		public function setJetpackTime(time:int):void {
			jetpackText.text = "Jetpack: " + time.toString();
			jetpackShadow.text = jetpackText.text;
		}
		
		public function removeJetpackTime():void {
			if (jetpackText) {
				if (jetpackText.parent) {	
					jetpackText.parent.removeChild(jetpackText);
					jetpackShadow.parent.removeChild(jetpackShadow);
				}
			}
		}
		
		public function removeDiamonds():void {
			diamondCount = 0;
			if (diamondIcon) {
				diamondIcon.remove();
				diamondIcon = null;
			}
			if (diamondText) {
				if (diamondText.parent) {	
					diamondText.parent.removeChild(diamondText);
				}
				diamondText = null;
			}
		}
		
		public function clear():void {
			removeJetpackTime();
			removeDiamonds();
			removeLifes();
			LevelInfo.numBubbles = 0;
			LevelInfo.numDiamonds = 0;
		}
		
		private function removeLifes():void {
			while (_lifes.length) {
				removeLife();
			}
		}
		
		public function hideJetpackTime():void {
			if (jetpackText) {
				jetpackText.visible = false;
				jetpackShadow.visible = false;
			} else {
				trace("error jetpack time removing while there is no jetpack time");
			}
		}
	}
}