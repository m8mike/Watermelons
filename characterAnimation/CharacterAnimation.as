package {
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.getQualifiedClassName;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class CharacterAnimation extends Costume {
		private var cached:CharAnimCached;
		public var config:CharAnimConfig;
		
		public function CharacterAnimation(mc:MovieClip, parent:DisplayObjectContainer, animConfig:CharAnimConfig = null) {
			cached = new CharAnimCached(mc);
			if (animConfig) {
				config = animConfig;
			} else {
				config = new CharAnimConfig();
			}
			animation = new Animation();
			animation.frames = cached.getFrames(config);
			animation.clip = mc;
			setScale(0.3);
			super(getQualifiedClassName(mc), parent);
		}
		
		public function setOnEnd(onEnd:Function):void {
			animation.onEnd = onEnd;
		}
		
		override public function flipRight(right:Boolean = true):void {
			if (!right) {
				config.left = true;
				animation.frames = cached.getFrames(config);
			}
			super.flipRight(right);
		}
		
		public function changeHat(id:int):void {
			config.hatID = id;
			animation.frames = cached.getFrames(config);
		}
		
		public function changeHands(id1:int, id2:int):void {
			if (config.left) {
				config.hands1ID = id2;
				config.hands2ID = id1;
			} else {
				config.hands1ID = id1;
				config.hands2ID = id2;
			}
			animation.frames = cached.getFrames(config);
		}
		
		public function setUmbrella(enabled:Boolean = true):void {
			enabled?changeHands(0, 1):changeHands(0, 0);
		}
		
		public function setRockets(enabled:Boolean = true):void {
			config.rockets = enabled;
			animation.frames = cached.getFrames(config);
		}
	}
}