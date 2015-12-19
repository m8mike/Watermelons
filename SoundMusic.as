package {
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class SoundMusic {
		private static var stSound:SoundTransform;
		
		public static function playJump():void {
			/*var jumpSound:Sound;
			jumpSound = new vg();
			jumpSound.play(0, 0, stSound);*/
		}
		
		public static function playPopBubble():void {
			/*var hitSound:Sound;
			hitSound = new pop_bubble();
			hitSound.play(0, 0, stSound);*/
		}
		
		public static function playBoink():void {
			/*var hitSound:Sound;
			hitSound = new boink();
			hitSound.play(0, 0, stSound);*/
		}
		
		public static function playChoom():void {
			/*var hitSound:Sound;
			hitSound = new choomier();
			hitSound.play(0, 0, stSound);*/
		}
		
		public static function setSoundVolume(volume:Number):void {
			if (!stSound) {
				stSound = new SoundTransform();
			}
			stSound.volume = volume;
		}
	}
}