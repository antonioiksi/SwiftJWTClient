//
//  LoginViewController.swift
//  JWTClient
//
//  Created by Antonchikov Alexander on 24/04/2018.
//
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    var access_token : String!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func loginClick(_ sender: Any) {

        let parameters: [String: String] = [
            "username" : self.username.text!,
            "password" : self.password.text!,
            ]
        let url = GlobalVariables.sharedManager.getBaseUrl() + "auth"
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON {
                [weak self] response in
                
                guard let strongSelf = self else { return }
                
                guard response.result.isSuccess,
                    let dictionaryArray = response.result.value as? [String: String] else {
                        
                        let alert = UIAlertController(title: "Alert", message: "Ошибка", preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
                        strongSelf.present(alert, animated: true, completion: nil)
                
                        return
                }
                strongSelf.access_token = dictionaryArray["access_token"]
                GlobalVariables.sharedManager.setAccessToken(access_token: strongSelf.access_token)
                
                strongSelf.performSegue(withIdentifier: "mainView", sender: strongSelf)
                //print(dictionaryArray)
        }
        
        
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        //let newVC: ViewController = segue.destination as! ViewController
        //newVC.access_token = self.access_token

    }
    

}
