package {
	import Box2D.Collision.Shapes.b2CircleDef;
	import Box2D.Collision.Shapes.b2ShapeDef;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class CircleShape extends MyShape {
		public var _radius;
		
		public function CircleShape(radius:Number) {
			_radius = radius / PhysicalWorld.RATIO;
		}
		
		override public function getShapeDef():b2ShapeDef {
			shapeDef = new b2CircleDef();
			b2CircleDef(shapeDef).radius = _radius;
			return shapeDef;
		}
		
		override public function getSimpleSprite(location:Point):Sprite {
			var sprite:Sprite = new Sprite();
			var color:uint = Math.random() * 0x1000000;
			sprite.graphics.lineStyle(2, color);
			sprite.graphics.beginFill(color + Math.random() * 0x1000);
			sprite.graphics.drawCircle(0, 0, _radius * PhysicalWorld.RATIO);
			sprite.graphics.endFill();
			return sprite;
		}
	}
}