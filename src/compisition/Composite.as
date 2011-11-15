package compisition 
{

	public class Composite extends Component
	{
		protected var aChildren:Array;
		
			public function Composite()
			{
				this.aChildren = new Array();
			}
			override public function Add(c:Component):void
			{
				aChildren.push(c);
				c.setParent(this);
			}
			override public function getBody(n:int):Component
			{
				if ((n > 0) && (n <= aChildren.length))
				{
					return aChildren[n-1];
				} else {
				return null;
				}
			}
			override public function operation():void
			{
				for each (var c:Component in aChildren)
				{
					c.operation();
				}
			}
			
		}
		
	

}