//
//  ViewController.swift
//  JWTClient
//
//  Created by Antonchikov Alexander on 24/04/2018.
//
//

import UIKit
import Log4swift
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var lightSwitch: UISwitch!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        let access_token = GlobalVariables.sharedManager.getAccessToken()
        if access_token.isEmpty {
            Logger.debug("access_token is empty than go to loginView")

            self.performSegue(withIdentifier: "loginView", sender: self)
        }
    }
    
    @IBAction func lightValueChanged(_ sender: Any) {
        
        let lightSwitchMessage : String!
        let lightSwitchUrl : String!

        
        if lightSwitch.isOn {
            lightSwitchMessage = "Light is On"
            lightSwitchUrl = GlobalVariables.sharedManager.getBaseUrl()+"on"
        } else {
            lightSwitchMessage = "Light is Off"
            lightSwitchUrl = GlobalVariables.sharedManager.getBaseUrl()+"off"
        }
        
        let alert = UIAlertController(title: "Alert", message: lightSwitchMessage, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        
        let headers: HTTPHeaders = [
            "Authorization": "JWT " + GlobalVariables.sharedManager.getAccessToken(),
            //"Accept": "application/json"
        ]
        
        Alamofire.request(lightSwitchUrl,
                          method: .get,
                          headers: headers).response {
                            [weak self] response in
                            
                            guard let strongSelf = self else { return }
                            
                            if let data = response.data {
                                let text = String(data: data, encoding: String.Encoding.utf8)
                                
                                let alert = UIAlertController(title: "Message", message: text, preferredStyle: UIAlertControllerStyle.alert)
                                alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
                                strongSelf.present(alert, animated: true, completion: nil)
                                
                                
                                print("Response: \(text)")
                            }
        }
        
        
        
    }
    
    @IBAction func logoutClick(_ sender: Any) {
        GlobalVariables.sharedManager.setAccessToken(access_token: "")
        Logger.debug("Setup empty access_token and go to loginView")
        self.performSegue(withIdentifier: "loginView", sender: self)
    }
}

