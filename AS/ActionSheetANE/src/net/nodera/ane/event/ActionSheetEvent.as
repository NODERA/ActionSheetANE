package net.nodera.ane.event
{
	import flash.events.Event;

	public class ActionSheetEvent extends Event
	{
		public static const CLICK_BUTTON:String = "click_button";
		public static const CLICK_CANCEL:String = "click_cancel";
		public static const CLICK_DESTRUCTIVE:String = "click_destructive";
		private var _idx:int;
		
		public function ActionSheetEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
		
		public function get index():int {
			return this._idx;
		}
		
		public function set index(idx:int):void {
			this._idx = idx;
		}
		
		override public function clone():Event 
		{
			return new ActionSheetEvent(type, bubbles, cancelable);
		}
		
		override public function toString():String 
		{
			// 必要なら追加したコンストラクタ引数も入れておく
			return formatToString("SendAPIEvent", "type", "bubbles", "cancelable", "eventPhase", "data"); 
		}
	}
}