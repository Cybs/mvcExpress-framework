// Licensed under the MIT license: http://www.opensource.org/licenses/mit-license.php
package mvcexpress.core.traceObjects.proxy {
import mvcexpress.core.namespace.pureLegsCore;
import mvcexpress.core.traceObjects.MvcTraceActions;
import mvcexpress.core.traceObjects.TraceObj_SendMessage;
import mvcexpress.mvc.Proxy;

/**
 * Class for mvcExpress tracing. (debug mode only)
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 * @private
 *
 * @version 2.0.beta2
 */
public class TraceProxy_sendMessage extends TraceObj_SendMessage {

	public var type:String;
	public var params:Object;

	public function TraceProxy_sendMessage(moduleName:String, $proxyObject:Proxy, $type:String, $params:Object, preSend:Boolean) {
		use namespace pureLegsCore;

		super(((preSend) ? MvcTraceActions.PROXY_SENDMESSAGE : MvcTraceActions.PROXY_SENDMESSAGE_CLEAN), moduleName);
		proxyObject = $proxyObject;
		type = $type;
		params = $params;
	}

}
}