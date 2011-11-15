package compisition 
{
	import flash.errors.IllegalOperationError;
	import flash.display.Sprite;
	public class Component extends Sprite
	{
		protected var parentNode:Composite = null;
		
			public function Add(c:Component):void
			{
				throw new IllegalOperationError("不能加身體~");
			}
			public function Remove(c:Component):void 
			{
				throw new IllegalOperationError("不能減身體"); 
			}
			public function getBody(length:int):Component
			{
				throw new IllegalOperationError("沒有身體~~"); 
				return null; 
			}
			public function operation():void 
			{ 
			};
			internal function setParent(compositeNode:Composite):void
			{
				parentNode = compositeNode;
			}
			public function getParent():Composite
			{
				return parentNode;
			}	
		}
}