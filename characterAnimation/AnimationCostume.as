package {
	import flash.display.DisplayObjectContainer;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class AnimationCostume extends Costume {
		
		public function AnimationCostume(id:String, parent:DisplayObjectContainer, scale:Number = 1, onEnd:Function = null) {
			animation = AnimationCache.getAnimation(id, scale);
			animation.bitmap.visible = false;
			//animation.gotoAndStop(1);
			animation.onEnd = onEnd;
			super(id, parent);
		}
	}
}