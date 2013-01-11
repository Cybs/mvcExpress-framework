// Licensed under the MIT license: http://www.opensource.org/licenses/mit-license.php
package org.mvcexpress.live {
import flash.utils.Dictionary;
import org.mvcexpress.core.namespace.mvcExpressLive;
import org.mvcexpress.core.taskTest.TaskTestVO;
import org.mvcexpress.utils.ExpressAssert;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
public class Task {
	
	/**
	 * process that handles the task.
	 * @private
	 */
	mvcExpressLive var process:Process;
	
	mvcExpressLive var prev:Task;
	mvcExpressLive var next:Task;
	
	private var injectPointRegistry:Dictionary = new Dictionary();
	
	mvcExpressLive var _isEnabled:Boolean = true;
	
	mvcExpressLive var _missingDependencyCount:int = 0;
	
	/**
	 * Simple object for testing.
	 */
	protected var assert:ExpressAssert = ExpressAssert.getInstance();
	
	/**
	 * Vector of all tests on this task.
	 * @private
	 * */
	CONFIG::debug
	mvcExpressLive var tests:Vector.<TaskTestVO> = new Vector.<TaskTestVO>();
	
	/**
	 * Runnable function. It will be executed everytime process runs.
	 * Must be ovveriden.
	 */
	public function run():void {
		// for override
	}
	
	//----------------------------------
	//    
	//----------------------------------
	
	/**
	 * Returs count of missing dependencies.
	 */
	public function get missingDependencyCount():int {
		use namespace mvcExpressLive;
		return _missingDependencyCount;
	}
	
	/**
	 * Returns if task is disabled by user.
	 */
	public function get isDisabled():Boolean {
		use namespace mvcExpressLive;
		return _isEnabled as Boolean;
	}
	
	//----------------------------------
	//     message sending
	//----------------------------------
	
	/**
	 * Sends message right now.
	 * @param	type
	 * @param	params
	 */
	protected function sendInstantMessage(type:String, params:Object = null):void {
		use namespace mvcExpressLive;
		process.sendInstantMessage(type, params);
	}
	
	/**
	 * Stacks message to be sent after current task is done.
	 * @param	type
	 * @param	params
	 */
	protected function sendPostMessage(type:String, params:Object = null):void {
		use namespace mvcExpressLive;
		process.stackPostMessage(type, params);
	}
	
	/**
	 * Stacks message to be sent after all tasks are done of current process run.
	 * @param	type
	 * @param	params
	 */
	protected function sendFinalMessage(type:String, params:Object = null):void {
		use namespace mvcExpressLive;
		process.stackFinalMessage(type, params);
	}
	
	//----------------------------------
	//     internal
	//----------------------------------
	
	mvcExpressLive function setInjectPoint(injectName:String, varName:String):void {
		injectPointRegistry[injectName] = varName;
	}
	
	mvcExpressLive function getInjectPoint(injectName:String):String {
		return injectPointRegistry[injectName];
	}
	
	mvcExpressLive function getMissingInjects():Vector.<String> {
		var retVal:Vector.<String> = new Vector.<String>();
		for (var name:String in injectPointRegistry) {
			if (this[injectPointRegistry[name]] == null) {
				retVal.push(name);
			}
		}
		return retVal;
	}	
	
	mvcExpressLive function setNotCached():void {
		use namespace mvcExpressLive;
		process.isCached = false;
	}
	
	mvcExpressLive function dispose():void {
		use namespace mvcExpressLive;
		prev = null;
		next = null;
		assert = null;
		injectPointRegistry = null;
		CONFIG::debug {
			for (var i:int = 0; i < tests.length; i++) {
				tests[i].testFunction = null;
			}
			tests = null;
		}
	}

}
}