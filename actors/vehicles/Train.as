package {
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Mad Mike
	 */
	public class Train extends Actor {
		private var car1:Tank;
		private var car2:Tank;/*
		private var car3:Tank;
		private var car4:Tank;*/
		
		public function Train() {
			car1 = new Tank(10, -6);
			car2 = new Tank(5, -6);/*
			car3 = new Tank(0, -6);
			car4 = new Tank( -5, -6);*/
			Joints.createDistanceJoint(car2.getBody(), car1.getBody());/*
			Joints.createDistanceJoint(car3.getBody(), car2.getBody());
			Joints.createDistanceJoint(car4.getBody(), car3.getBody());*/
			super(new Point(0, 0));
			Updatables.addCharacter(this);
		}
		
		override public function update():void {
			/*if (car1.enterable.inside) {
				car2.control();
				car3.control();
				car4.control();
			}*/
		}
	}
}