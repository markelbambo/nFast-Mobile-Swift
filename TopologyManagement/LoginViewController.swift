//
//  LoginViewController.swift
//  TopologyManagement
//
//  Created by Mark Anthony Elbambo on 4/5/15.
//  Copyright (c) 2015 Narra Systems Corp. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var usernameTxt: UITextField!
    
    @IBOutlet var passwordTxt: UITextField!
    
    @IBOutlet var serverIPTxt: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginBtn(sender: UIButton) {
        let username:NSString = usernameTxt.text
        let password:NSString = passwordTxt.text
        let serverIP:NSString = serverIPTxt.text
        
        if ( username.isEqualToString("") || password.isEqualToString("") ) {
            
            var alertView:UIAlertView = UIAlertView()
            alertView.title = "Sign in Failed!"
            alertView.message = "Please enter Username and Password"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
        } else {
            
            var post:NSString = "action=Authenticate&query={'QUERY':[{'User':'markelbambo','Pass':'d333977d5366e5b770b9892bf0a99abc'}]}"
            
            NSLog("PostData: %@",post);
            
            var url:NSURL = NSURL(string:"http://50.247.67.140/cgi-bin/NFast_3-0/CGI/ADMINISTRATION/FQueryCgiAdminPy.py")!
            
            NSLog("URL: %@",url);
            var postData:NSData = post.dataUsingEncoding(NSASCIIStringEncoding)!
            
            var postLength:NSString = String( postData.length )
            
            var request:NSMutableURLRequest = NSMutableURLRequest(URL: url)
            request.HTTPMethod = "POST"
            request.setValue(postLength as String, forHTTPHeaderField: "Content-Length")
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            request.HTTPBody = postData
            
            
            var reponseError: NSError?
            var response: NSURLResponse?
            
            var urlData: NSData! = NSURLConnection.sendSynchronousRequest(request, returningResponse:&response, error:&reponseError)
            NSLog("%@", urlData!);
            
            if ( urlData != nil ) {
                let res = response as! NSHTTPURLResponse!;
                
                NSLog("Response code: %ld", res.statusCode);
                
                if (res.statusCode >= 200 && res.statusCode < 300)
                {
                    var responseData:NSString  = NSString(data:urlData!, encoding:NSUTF8StringEncoding)!
                    
                    NSLog("Response ==> %@", responseData);
                    
                    let aString: String = responseData as String
                    let newString = aString.stringByReplacingOccurrencesOfString("'", withString: "\"", options: NSStringCompareOptions.LiteralSearch, range: nil)
                    println("aString==\(aString)")
                    
                    var error: NSError?
                    
                    let jsonData:NSDictionary = NSJSONSerialization.JSONObjectWithData(urlData!, options:NSJSONReadingOptions.MutableContainers , error: &error) as! NSDictionary
                    
                    
                    
                    let success:NSInteger = jsonData.valueForKey("success") as! NSInteger
                    
                    //[jsonData[@"success"] integerValue];
                    
                    NSLog("Success: %ld", success);
                    
                    if(success == 1)
                    {
                        NSLog("Login SUCCESS");
                        
                        var prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
                        prefs.setObject(username, forKey: "USERNAME")
                        prefs.setInteger(1, forKey: "ISLOGGEDIN")
                        prefs.synchronize()
                        
                        self.dismissViewControllerAnimated(true, completion: nil)
                    } else {
                        var error_msg:NSString
                        
                        if jsonData["error_message"] as? NSString != nil {
                            error_msg = jsonData["error_message"] as! NSString
                        } else {
                            error_msg = "Unknown Error"
                        }
                        var alertView:UIAlertView = UIAlertView()
                        alertView.title = "Sign in Failed!"
                        alertView.message = error_msg as String
                        alertView.delegate = self
                        alertView.addButtonWithTitle("OK")
                        alertView.show()
                        
                    }
                    
                } else {
                    var alertView:UIAlertView = UIAlertView()
                    alertView.title = "Sign in Failed!"
                    alertView.message = "Connection Failed"
                    alertView.delegate = self
                    alertView.addButtonWithTitle("OK")
                    alertView.show()
                }
            } else {
                NSLog(">>>>>>>>>")
                var alertView:UIAlertView = UIAlertView()
                alertView.title = "Sign in Failed!"
                alertView.message = "Connection Failure"
                if let error = reponseError {
                    alertView.message = (error.localizedDescription)
                }
                alertView.delegate = self
                alertView.addButtonWithTitle("OK")
                alertView.show()
            }
        }
        
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {   //delegate method
        textField.resignFirstResponder()
        return true
    }

}
