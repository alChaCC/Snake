package compisition 
{
	import flash.geom.Point;
	public class snakeBody extends Composite
	{
		private var bodyLength:Number = 30;
		public function snakeBody() 
		{
			graphics.beginFill(0xC0C0C0);
			graphics.drawRect(0,0, 20, 20);
			graphics.endFill();
		}
		
		override public function operation():void
		{
			var myParent:Composite = this.getParent();
			var parentLocation:Point = new Point (myParent.x, myParent.y);
			var myLocation:Point = new Point(this.x, this.y);
			var currentDistance:Number = Point.distance(parentLocation, myLocation);
			var myNewLocation:Point = Point.interpolate(myLocation, parentLocation, bodyLength / currentDistance);
			this.x = myNewLocation.x;
			this.y = myNewLocation.y;
			super.operation();
		}
		
	}

}