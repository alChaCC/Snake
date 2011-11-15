package 
{
	import compisition.Component;
	import compisition.Composite;
	import compisition.snakeBody;
	import compisition.snakeHead;
	import flash.display.Sprite;
	import flash.events.*;
	import flash.ui.Keyboard;
	import flash.utils.Timer;
	import flash.text.TextField;
	public class Main extends Sprite 
	{
		private var snake:Composite ;
		private var speed:int = 20;
		private var keyPressed:uint;
		private var snakefood:Sprite;
		private var parentNode:Composite ;
		private var timer:Timer;
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			snake = new snakeHead();
			snake.x = snake.y = 200;
			snakefood = new Food();
			addChild(snakefood);
			addChild(snake);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, gamestart);
			parentNode = snake;
			//parentNode = new snakeBody();
			//snake.Add(parentNode);
			timer = new Timer(100);
			timer.start();
			timer.addEventListener(TimerEvent.TIMER, moveSnake);
		}
		public function gamestart(event:KeyboardEvent):void
		{
			keyPressed = event.keyCode;
		}
		public function moveSnake(event:TimerEvent):void
		{
			removeEventListener(TimerEvent.TIMER, moveSnake);
			snake.operation();
			if (keyPressed == Keyboard.RIGHT)
			{	snake.x += speed ;}
			if (keyPressed == Keyboard.LEFT)
			{	snake.x -= speed ;}
			if (keyPressed == Keyboard.UP)
			{	snake.y -=  speed;}
			if (keyPressed == Keyboard.DOWN)
			{	snake.y += speed; }
			
			if (snake.hitTestObject(snakefood))
			{
				removeChild(snakefood);
				snakefood= new Food();
				this.addChild(snakefood);
				var body:Composite = new snakeBody();
				body.x = body.y = -100;
				parentNode.Add(body);
				this.addChild(body);
				parentNode = body;
			}
			
			if (snake.x > this.stage.stageWidth || snake.x < 0 || snake.y>this.stage.stageHeight || snake.y<0 )
			{
				timer.stop();
				var message:TextField = new TextField();
				message.text = " you lose~~~~~";
				addChild(message);
			}
			
		}
	}
	
}