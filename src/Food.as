package  
{
	import flash.display.Sprite;
	public class Food extends Sprite
	{
		public function Food() 
		{
			graphics.beginFill(0x330000);
			graphics.drawCircle(Math.random()*640+10, Math.random()*500+10,10);
			graphics.endFill();
		}
	}

}