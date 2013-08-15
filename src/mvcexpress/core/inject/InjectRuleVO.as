// Licensed under the MIT license: http://www.opensource.org/licenses/mit-license.php
package mvcexpress.core.inject {

/**
 * FOR INTERNAL USE ONLY.
 * Value Object to keep injection rules - what have to be injected there.
 * @private
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 *
 * @version 2.0.beta2
 */
public class InjectRuleVO {

	/** FOR INTERNAL USE ONLY. Name of variable to inject object into. */
	public var varName:String;

	/** FOR INTERNAL USE ONLY. Injection identifier, formed by class name and your custom inject name. */
	public var injectClassAndName:String;

	CONFIG::debug
	public function toString():String {
		return "[InjectRuleVO varName=" + varName + " injectClassAndName=" + injectClassAndName + "]";
	}
}
}