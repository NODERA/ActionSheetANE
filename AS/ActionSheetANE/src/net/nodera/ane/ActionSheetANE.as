package net.nodera.ane
{
	import flash.display.BitmapData;
	import flash.events.EventDispatcher;
	import flash.events.StatusEvent;
	import flash.external.ExtensionContext;
	
	import net.nodera.ane.event.ActionSheetEvent;
	
	public class ActionSheetANE extends EventDispatcher
	{
		private const EXTENSION_ID:String = 'net.nodera.ane.ActionSheetANE';
		private var context:ExtensionContext;
		
		public function ActionSheetANE()
		{
			context = ExtensionContext.createExtensionContext(EXTENSION_ID, null);
		}
		
		public function show(title:String = "", cancel:String = "", destructive:String = "", other_buttons:String = ""):void {
			context.addEventListener(StatusEvent.STATUS, onClickedButtonEvent);
			context.call("show", title, cancel, destructive, other_buttons);
		}
		
		private function onClickedButtonEvent(event:StatusEvent):void {
			var button_index:int = parseInt(event.level);
			var e:ActionSheetEvent;
			if(event.code == "CLICKED_BUTTON") {
				e = new ActionSheetEvent(ActionSheetEvent.CLICK_BUTTON);
				e.index = button_index;
			} else if(event.code == "CLICKED_CANCELE") {
				e = new ActionSheetEvent(ActionSheetEvent.CLICK_CANCEL);
				e.index = button_index;
			} else if(event.code == "CLICKED_DESTRUCTIVE") {
				e = new ActionSheetEvent(ActionSheetEvent.CLICK_DESTRUCTIVE);
				e.index = button_index;
			}
			 
			dispatchEvent(e);
			context.removeEventListener( StatusEvent.STATUS, onClickedButtonEvent);
		}

		public function dispose():void {
			context.dispose();
		}
	}
}