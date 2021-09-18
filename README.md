# flutter_module_ios

# 目的
iOSアプリからFlutterモジュールを呼び出す

# やり方
３つ方法がある。
1. CocoaPodsとFlutterSDKを埋め込む
1. frameworksをXcodeに埋め込む
1. CocoaPodsを使用してXcodeおよびFlutterフレームワークにアプリケーションとプラグインのフレームワークを埋め込む

このレポジトリでは１つめの”CocoaPodsとFlutterSDKを埋め込む”を検証した。


## Flutterモジュール作成

`＄ flutter create --template module 任意の名前`  

Flutterモジュールを作成したら、Xcodeのプロジェクトファイルと同じ階層にFlutterモジュールを移動させる


## iOSアプリのPodfileを編集
以下をPodfileに追加

    flutter_application_path = '../flutter_module_sample'
    load File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')　

    target 'flutter_module_import_demo' do
      use_frameworks!
      install_all_flutter_pods(flutter_application_path)
    end

ターミナルで以下を実行する  
`＄ pod install`  

## iOSアプリからの呼び出し

立ち上げ時にFlutterエンジンをこしらえておく

    @main
    class AppDelegate: FlutterAppDelegate {
    
        var flutterEngine : FlutterEngine?;
    
        override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            self.flutterEngine = FlutterEngine(name: "io.flutter", project: nil);
            self.flutterEngine?.run(withEntrypoint: nil);
            GeneratedPluginRegistrant.register(with: self.flutterEngine!);
            return super.application(application, didFinishLaunchingWithOptions: launchOptions);
        }
    }

任意の場所で呼び出してpresentでFlutterモジュールが表示される  

    let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil);
    present(flutterViewController, animated: true, completion: nil)



