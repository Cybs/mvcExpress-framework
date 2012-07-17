package suites.testObjects.main {
import org.mvcexpress.modules.ModuleSprite;
import org.mvcexpress.mvc.Proxy;
import suites.SuiteModuleNames;
import suites.testObjects.controller.GetProxyTestCommand;
import suites.testObjects.module.SimpleTestProxy;

/**
 * COMMENT
 * @author Raimundas Banevicius (raima156@yahoo.com)
 */
public class MainModule extends ModuleSprite {
	
	private var dataProxy:MainDataProxy;
	private var testView:MainView;
	
	static public const NAME:String = SuiteModuleNames.MAIN_MODULE;
	
	public function MainModule() {
		super(MainModule.NAME, true, false);
	}
	
	override protected function onInit():void {
		dataProxy = new MainDataProxy();
		proxyMap.map(dataProxy);
		mediatorMap.map(MainView, MainViewMediator);
	}
	
	override protected function onDispose():void {
		proxyMap.unmap(MainDataProxy);
		dataProxy = null;
	}
	
	//----------------------------------
	//     
	//----------------------------------
	
	public function createLocalCommand(message:String):void {
		commandMap.map(message, MainLocalCommand)
	}
	
	public function createLocalHandler(message:String):void {
		if (!testView) {
			testView = new MainView();
			mediatorMap.mediate(testView);
		}
		testView.addLocalhandler(message);
	}
	
	public function createRemoteCommand(message:String):void {
		commandMap.mapRemote(message, MainRemoteCommand, SuiteModuleNames.EXTERNAL_MODULE);
	}
	
	public function createRemoteHandler(message:String):void {
		if (!testView) {
			testView = new MainView();
			mediatorMap.mediate(testView);
		}
		testView.addRemoteHandler(message);
	}
	
	public function sendTestMessage(message:String):void {
		sendMessage(message);
	}
	
	public function removeLocalCommand(message:String):void {
		commandMap.unmap(message, MainLocalCommand)
	}
	
	public function removeLocalHandler(message:String):void {
		if (!testView) {
			testView = new MainView();
			mediatorMap.mediate(testView);
		}
		testView.removeLocalhandler(message);
	}
	
	public function removeRemoteCommand(message:String):void {
		commandMap.unmapRemote(message, MainRemoteCommand, SuiteModuleNames.EXTERNAL_MODULE);
	}
	
	public function removeRemoteHandler(message:String):void {
		if (!testView) {
			testView = new MainView();
			mediatorMap.mediate(testView);
		}
		testView.removeRemoteHandler(message);
	}
	
	//----------------------------------
	//     
	//----------------------------------
	
	public function mapTestProxy(testProxy:Proxy, injectClass:Class = null, name:String = ""):void {
		proxyMap.map(testProxy, injectClass, name);
	}
	
	public function getTestProxy(proxyClass:Class, name:String = ""):Proxy {
		return proxyMap.getProxy(proxyClass, name);
	}
	
	public function getProxyFromProxy(proxyClass:Class, name:String = ""):Proxy {
		return dataProxy.getTestProxy(proxyClass, name);
	}
	
	public function getProxyFromMediator(proxyClass:Class, name:String = ""):Proxy {
		if (!testView) {
			testView = new MainView();
			mediatorMap.mediate(testView);
		}
		testView.testGetProxyClass(proxyClass, name);
		return dataProxy.testProxy;
	}
	
	public function getProxyInCommand(proxyClass:Class, name:String = ""):Proxy {
		commandMap.execute(GetProxyTestCommand, {moduleClass: proxyClass, moduleName: name});
		return dataProxy.testProxy;
	}
	
	//----------------------------------
	//     
	//----------------------------------
	
	public function get localCommandCount():int {
		return dataProxy.localCommandCount;
	}
	
	public function get localHandlerCount():int {
		return dataProxy.localHandlerCount;
	}
	
	public function get remoteCommandCount():int {
		return dataProxy.remoteCommandCount;
	}
	
	public function get remoteHandlerCount():int {
		return dataProxy.remoteHandlerCount;
	}

	
	// TODO : add tests with hosting.
	
	// TODO : add tests with multiply proxiest.?? (maybe dont belong here..)
	
}
}