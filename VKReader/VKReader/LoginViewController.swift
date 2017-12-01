//
//  LoginViewController.swift
//  VKReader
//
//  Created by Dzmitry Kopats on 11/20/17.
//  Copyright © 2017 Dzmitry Kopats. All rights reserved.
//

import UIKit
import VK_ios_sdk

class LoginViewController: UIViewController, VKSdkDelegate, VKSdkUIDelegate {
    @IBOutlet weak var loginButton: UIButton!
 
    let VK_APP_ID = "6266460"
    override func viewDidLoad() {
        let sdkInstance = VKSdk.initialize(withAppId: self.VK_APP_ID)
        sdkInstance?.register(self);
        sdkInstance?.uiDelegate = self;
        print("LoginViewController - viewDidLoad")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonTap(_ sender: Any) {
        print("loginButtonTap")
        VKSdk.authorize([VK_PER_WALL, VK_PER_FRIENDS])
    }
    
    // MARK: _______________
    // MARK: VKSdkDelegate
    
    // required
    func vkSdkUserAuthorizationFailed() -> Void {
        print("---vkSdkUserAuthorizationFailed😐")
    }
    
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        guard result.token != nil else {
            print("Failure😐")
            return
        }
        print("Success🙂! ")
        UserDefaults.standard.set(result.token.accessToken, forKey: "token")
        // https://api.vk.com/method/newsfeed.get?count=1&access_token=0c7c1227198ef4ae0e38e4372d2a95e0db81efdf9ed5eadeb6c297ee1608d4726774831877c37d391d57d
    }
    
    // optional
    func vkSdkAccessTokenUpdated(newToken:VKAccessToken?, oldToken:VKAccessToken?) -> Void {
        print("---vkSdkAccessTokenUpdated")
    }
    
    func vkSdkTokenHasExpired(_ expiredToken: VKAccessToken!) {
        print("---vkSdkTokenHasExpired")
    }
    
    
    func vkSdkAuthorizationStateUpdated(with result: VKAuthorizationResult!) {
        print("---vkSdkAuthorizationStateUpdated")
    }
    
    // MARK: _______________
    // MARK: VKSdkUIDelegate
    
    // required
    func vkSdkShouldPresent(_ controller: UIViewController!) {
        present(controller, animated: true, completion: nil)
        print("---vkSdkShouldPresent")
    }
    func vkSdkNeedCaptchaEnter(_ captchaError:VKError?) -> Void {
        print("---vkSdkNeedCaptchaEnter")
        print(captchaError ?? "some captcha error 😐")
    }
    
    // optional
    
    func vkSdkDidDismiss(_ controller: UIViewController!) {
        self.navigationController?.pushViewController(FeedViewController(), animated: true)
        print("---vkSdkDidDismissViewController")
    }
}
