package {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.utils.getDefinitionByName;
	import flash.utils.setTimeout;
	
	public class AnimationCache extends EventDispatcher { 
		private static var cachedAnimations:Array = [];
		
		public static function getAnimation(id:String, scale:Number = 1):Animation {
			var animation:Animation;
			if (!cachedAnimations[id]) {
				animation = new Animation();
				animation.buildCacheFromLibrary(id, scale);
				cachedAnimations[id] = animation;
				return animation;
			} else if (cachedAnimations[id].scale != scale) {
				animation = new Animation();
				animation.buildCacheFromLibrary(id, scale);
				return animation;
			}
			animation = new Animation();
			animation.frames = cachedAnimations[id].frames;
			animation.bitmap.x = cachedAnimations[id].bitmap.x
			animation.bitmap.y = cachedAnimations[id].bitmap.y
			animation.clip = cachedAnimations[id].clip;
			return animation;
		}
	}
}