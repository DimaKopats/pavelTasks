//
//  ViewController.swift
//  Sender
//
//  Created by Dzmitry Kopats on 7/24/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var mapsButton: UIButton!
    @IBOutlet weak var youtubeButton: UIButton!
    @IBOutlet weak var receiverButton: UIButton!
    
    private func designFor(button: UIButton) {
        button.layer.cornerRadius = 8
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.6
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        designFor(button: mapsButton)
        designFor(button: youtubeButton)
        designFor(button: receiverButton)
    }

    @IBAction func mapsButtonTapped(_ sender: Any) {
        let path = "http://maps.apple.com/?q=" // 1
        let searchQuerry = textField.text!.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)! // 2
        let url = URL(string: path+searchQuerry)! // 3
        
        UIApplication.shared.open(url, options: [:], completionHandler: nil) // 4
        
    }
    
    @IBAction func youtubeButtonTapped(_ sender: Any) {
        let path = "http://youtube.com/results?search_query=" // 1
        let searchQuerry = textField.text!.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)! // 2
        let url = URL(string: path+searchQuerry)! // 3
        
        UIApplication.shared.open(url, options: [:], completionHandler: nil) // 4
    }
    
    @IBAction func receiverButtonTapped(_ sender: Any) {
        let path = "receiverapp://"
        let searchQuerry = textField.text!.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
        let url = URL(string: path+searchQuerry)!
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            let alert = UIAlertController(title: "Receiver не найден", message: "Приложение приемник ReceiverApp не установлено на данном устройстве", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .default, handler: { _ in
                self.dismiss(animated: true, completion: nil)
            })
            alert.addAction(ok)
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}

