package {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Platform extends Actor {
		protected var body:b2Body;
		public var shape:MyShape;
		public var bodyBuilder:BodyBuilder;
		public var width:Number;
		public var height:Number;
		protected var currentAngle:Number = 0;
		
		public function Platform(x:Number, y:Number, w:Number = 1, h:Number = 1) {
			var loc:Point = new Point(x * PhysicalWorld.MIN_SQARE, y * PhysicalWorld.MIN_SQARE);
			width = w;
			height = h;
			super(loc);
			createShapes();
			Updatables.addPlatform(this);
			/*createBodies();
			init(body);*/
		}
		
		protected function init(myBody:b2Body):void {
			body = myBody;
			body.SetUserData(this);
			setAngle(currentAngle);
		}
		
		public function setAngle(angle:Number):void {
			if (body) {	
				currentAngle = angle;
				body.SetXForm(body.GetPosition(), currentAngle / 180 * Math.PI);
			}
		}
		
		public function setLoc(loc:b2Vec2):void {
			if (body) {	
				body.SetXForm(loc, body.GetAngle());
			}
		}
		
		override public function hide():void {
			if (body) {
				removeBodies();
			}
		}
		
		public function show():void {
			if (!body) {
				createBodies();
				init(body);
			}
		}
		
		public function getBody():b2Body {
			return body;
		}
		
		override protected function cleanUpBeforeRemoving():void {
			Updatables.removePlatform(this);
			super.cleanUpBeforeRemoving();
		}
		
		protected function createShapes():void {
			shape = new RectShape(width * PhysicalWorld.MIN_SQARE, height * PhysicalWorld.MIN_SQARE);
		}
		
		protected function createBodies():void {
			if (!bodyBuilder) {
				bodyBuilder = new StaticBodyBuilder();
				StaticBodyBuilder(bodyBuilder).groupIndex = -2;
			}
			bodyBuilder.x = location.x;
			bodyBuilder.y = location.y;
			body = StaticBodyBuilder(bodyBuilder).getBody(new Array(shape));
		}
		
		override protected function removeBodies():void {
			PhysicalWorld.safeRemoveBody(body);
			body = null;
			super.removeBodies();
		}
	}
}