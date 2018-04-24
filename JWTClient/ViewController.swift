//
//  ViewController.swift
//  JWTClient
//
//  Created by Antonchikov Alexander on 24/04/2018.
//
//

import UIKit

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
            self.performSegue(withIdentifier: "loginView", sender: self)
        }
    }
    
    @IBAction func lightValueChanged(_ sender: Any) {
        
        let lightSwitchMessage : String!
        if lightSwitch.isOn {
            lightSwitchMessage = "Light is On"
        } else {
            lightSwitchMessage = "Light is Off"
        }
        
        let alert = UIAlertController(title: "Alert", message: lightSwitchMessage, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func logoutClick(_ sender: Any) {
        GlobalVariables.sharedManager.setAccessToken(access_token: "")
        
        self.performSegue(withIdentifier: "loginView", sender: self)
    }
}

