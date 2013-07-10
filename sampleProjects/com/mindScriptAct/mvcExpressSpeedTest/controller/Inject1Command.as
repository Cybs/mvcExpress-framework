package com.mindScriptAct.mvcExpressSpeedTest.controller {
import mvcexpress.messager.Notice;
import mvcexpress.mvc.Command;
import com.mindScriptAct.mvcExpressSpeedTest.model.BlankProxy;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
public class Inject1Command extends Command {

	[Inject]
	public var blankProxy:BlankProxy;

	override public function execute(notice:Notice):void {
		trace( "Inject1Command.execute > notice : " + notice );


		//commandMap.execute

		//mediatorMap...

		//proxyMap...

		messenger.
	}

}
}