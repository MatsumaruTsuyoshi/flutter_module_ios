//
//  ViewController.swift
//  flutter_module_import_demo
//
//  Created by 松丸豪志 on 2021/09/15.
//

import UIKit
import Flutter

class ViewController: UIViewController {
    let flutterEngine = ((UIApplication.shared.delegate as? AppDelegate)?.flutterEngine)!;

    override func viewDidLoad() {
        super.viewDidLoad()
        flutterEngine.run()
        let button:UIButton = UIButton(frame: CGRect(x: 0, y: 50, width: self.view.frame.width, height: self.view.frame.height / 4))
        button.backgroundColor = .black
        button.setTitle("sample", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(pushButton), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    @objc func pushButton(sender: UIButton){
            print("button pushed.")
            let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil);
            present(flutterViewController, animated: true, completion: nil)
        }

        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }

}

