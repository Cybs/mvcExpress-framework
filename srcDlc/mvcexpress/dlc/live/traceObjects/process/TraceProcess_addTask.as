// Licensed under the MIT license: http://www.opensource.org/licenses/mit-license.php
package mvcexpress.dlc.live.traceObjects.process {
import mvcexpress.core.traceObjects.TraceObj;
import mvcexpress.dlc.live.traceObjects.MvcTraceActionsLive;

/**
 * Class for mvcExpress tracing. (debug mode only)
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
public class TraceProcess_addTask extends TraceObj {

	public var taskClass:Class;
	public var name:String;
	public var skip:Boolean;

	public function TraceProcess_addTask(action:String, moduleName:String, $taskClass:Class, $name:String, $skip:Boolean = false) {
		super(action, moduleName);
		skip = $skip;
		taskClass = $taskClass;
		name = $name;
	}

	override public function toString():String {
		if (skip) {
			return "ÆÆÆ+ " + MvcTraceActionsLive.PROCESS_ADDTASK + "WARNING!: this task is already added. > taskClass : " + taskClass + ", name : " + name + "     {" + moduleName + "}";
		}
		return "ÆÆÆ+ " + MvcTraceActionsLive.PROCESS_ADDTASK + " > taskClass : " + taskClass + ", name : " + name + "     {" + moduleName + "}";
	}

}
}