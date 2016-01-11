package {
	
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class Cog extends Wheel {
		
		public function Cog() {
		
		}
		
		private var world:b2World=new b2World(new b2Vec2(0,10),true);
		private var worldScale:Number=30;
		private var theCog:b2Body;
		public function Main() {
			debugDraw();
			addCog(Math.random()*340+150,Math.random()*180+150,Math.random()*100+50,Math.random()*30+5,Math.random()*20+5,Math.floor(Math.random()*15)+6,Math.random()+1);
			addEventListener(Event.ENTER_FRAME,update);
			stage.addEventListener(MouseEvent.CLICK,createCog);
		}
		private function createCog(e:MouseEvent):void {
			world.DestroyBody(theCog);
			addCog(Math.random()*340+150,Math.random()*180+150,Math.random()*100+50,Math.random()*30+5,Math.random()*20+5,Math.floor(Math.random()*15)+6,Math.random()+1);
		}
		private function addCog(pX:Number,pY:Number,r:Number,cogWidth:Number,cogHeight:Number,nCogs:Number,motorSpeed:Number):void {
			var circleShape:b2CircleShape=new b2CircleShape(r/worldScale);
			var bodyDef:b2BodyDef=new b2BodyDef();
			bodyDef.position.Set(pX/worldScale,pY/worldScale);
			var polygonShape:b2PolygonShape = new b2PolygonShape();
			for (var i:Number=0; i<nCogs; i++) {
				var angle:Number = 2*Math.PI/nCogs*i
				polygonShape.SetAsOrientedBox(cogWidth/worldScale/2,cogHeight/worldScale/2,new b2Vec2(r*Math.cos(angle)/worldScale,r*Math.sin(angle)/worldScale),angle);
			}
		}
	}
}