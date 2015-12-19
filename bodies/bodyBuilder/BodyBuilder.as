package {
	import Box2D.Collision.Shapes.b2CircleDef;
	import Box2D.Collision.Shapes.b2PolygonDef;
	import Box2D.Collision.Shapes.b2ShapeDef;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class BodyBuilder {
		private var _shapes:Array;
		private var _body:b2Body;
		
		public var x:Number = 0;
		public var y:Number = 0;
		public var angle:Number = 0;
		
		public var density:Number = 0;
		public var friction:Number = 0.2;
		public var restitution:Number = 0.3;
		
		public var groupIndex:int = 0;
		public var isSensor:Boolean = false;
		
		public var linearDamping:Number = 0;
		public var angularDamping:Number = 0;
		
		public var jumpThrough:Boolean = false;
		public var fixedRotation:Boolean = false;
		public var bullet:Boolean = false;
		
		public function BodyBuilder() {
		
		}
		
		public function getBody(arrayOfShapes:Array):b2Body {
			_shapes = arrayOfShapes;
			if (_body) {
				return _body;
			} else {
				var allShapeDefs:Array = [];
				for each (var shape:MyShape in arrayOfShapes) {
					var shapeDef:b2ShapeDef = shape.getShapeDef();
					shapeDef.density = density;
					shapeDef.friction = friction;
					shapeDef.restitution = restitution;
					shapeDef.isSensor = isSensor;
					shapeDef.filter.groupIndex = groupIndex;
					allShapeDefs.push(shapeDef);
				}
				var bodyDef:b2BodyDef = new b2BodyDef();
				bodyDef.position.Set(x / PhysicalWorld.RATIO, y / PhysicalWorld.RATIO);
				
				bodyDef.fixedRotation = fixedRotation;
				bodyDef.linearDamping = linearDamping;
				bodyDef.angularDamping = angularDamping;
				
				var _body:b2Body;
				_body = PhysicalWorld.createBody(bodyDef);
				if (!_body) {
					return null;
				}
				for each (var newShapeDefToAdd:b2ShapeDef in allShapeDefs) {
					_body.CreateShape(newShapeDefToAdd);
				}
				_body.SetMassFromShapes();
				_body.SetBullet(bullet);
				if (angle) {
					_body.SetXForm(_body.GetPosition(), angle * Math.PI / 180);
				}
				return _body;
			}
		}
	}
}