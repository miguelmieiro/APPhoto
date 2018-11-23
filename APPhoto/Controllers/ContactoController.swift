//
//  ContactoController.swift
//  APPhoto
//
//  Created by Miguel Mieiro on 22/11/2018.
//  Copyright © 2018 Miguel Mieiro. All rights reserved.
//

import UIKit
import MessageUI

class ContactoController: UIViewController, MFMailComposeViewControllerDelegate, UITextViewDelegate {
    
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var telefoneLabel: UILabel!
    @IBOutlet weak var saberMaisLabel: UILabel!
    @IBOutlet weak var aceitoRespostaLabel: UILabel!
    @IBOutlet weak var aceitoPubLabel: UILabel!
    
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var telefoneTextField: UITextField!
    @IBOutlet weak var mensagemTextView: UITextView!
    
    @IBOutlet weak var umDiaSwitch: UISwitch!
    @IBOutlet weak var curtasSwitch: UISwitch!
    @IBOutlet weak var outrosSwitch: UISwitch!
    @IBOutlet weak var respSwitch: UISwitch!
    @IBOutlet weak var pubSwitch: UISwitch!
    
    @IBAction func closeButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func enviarButton(_ sender: Any) {
        sendMail()
    }
    @IBAction func facebookButton(_ sender: Any) {
    }
    @IBAction func instagramButton(_ sender: Any) {
    }
    @IBAction func googleButton(_ sender: Any) {
    }
    
    let messageSubject = "Contacto"
    let messageBody = "Hello World"
    let messageSender: String = "email de envio"
    let textViewPlaceholder = "Falem-me de vocês. Quantos são, os nomes e as idades dos miúdos. O que procuram para a vossa sessão?"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mensagemTextView.delegate = self
        mensagemTextView.text = textViewPlaceholder
        mensagemTextView.textColor = UIColor.lightGray
    }
    
    //MARK: Edicao do text view
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textView.text = textViewPlaceholder
             mensagemTextView.textColor = UIColor.lightGray
        }
    }
    
   
    
    //MARK: Funcao para o envio de email
    func sendMail () {
        
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["miguelmieiro@gmail.com"])
            mail.setMessageBody(messageBody, isHTML: true)
            mail.setSubject(messageSubject)
            mail.setPreferredSendingEmailAddress(emailTextField.text ?? "o seu email")
            
            present(mail, animated: true)
        }else{
            // error
            print("Failed to sent mail")
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
}
