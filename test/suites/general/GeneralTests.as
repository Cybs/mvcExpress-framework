package suites.general {
import org.flexunit.Assert;
import org.mvcexpress.MvcExpress;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
public class GeneralTests {

	[Before]

	public function runBeforeEveryTest():void {
	}

	[After]

	public function runAfterEveryTest():void {
	}

	[Test(description="Version Test")]

	public function general_framework_version():void {
		trace("VERSION");
		trace( MvcExpress.VERSION);
		Assert.assertEquals("Version must be defined using 3 numbers, separated by dots.", MvcExpress.VERSION.split(".").length, 3);
	}

	[Test(description="Debug flag Test")]

	public function general_debug_flag():void {
		trace("DEBUG_COMPILE");
		CONFIG::debug {
			trace(MvcExpress.DEBUG_COMPILE);
			Assert.assertTrue("While compiling in debug - MvcExpress.DEBUG_COMPILE must be true.", MvcExpress.DEBUG_COMPILE);
			return;
		}
		Assert.assertFalse("While compiling in debug - MvcExpress.DEBUG_COMPILE must be false.", MvcExpress.DEBUG_COMPILE);
	}

}
}