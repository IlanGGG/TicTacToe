//
//  ViewController.swift
//  Morpion
//
//  Created by Ilan Gallula on 26/12/2018.
//  Copyright © 2018 Ilan Gallula. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var aQuiLeTourLabel: UILabel!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    
    var circle = true
    var buttons = [UIButton]()

    override func viewDidLoad() {
        super.viewDidLoad()
        AdjustToWhoTheTurnLabel()
        buttons = [button1,button2,button3,button4,button5,button6,button7,button8,button9]
        
    }

    @IBAction func PressButton(_ sender: Any) {
        
        guard  let button = sender as? UIButton, button.image(for: .normal) == UIImage(named: "help") else {return}
        if circle {
            button.setImage(UIImage(named: "Circle"), for: .normal)
            
        }else {
            button.setImage(UIImage(named: "cross"), for: .normal)
            
        }
        
        CheckIfYouWin()
    }
    
    
    
    func AdjustToWhoTheTurnLabel(){
        if circle {
            aQuiLeTourLabel.text = "Au tour du joueur 1"
        }else {
            aQuiLeTourLabel.text = "Au tour du joueur 2"
        }
        
    }
    func ShowTheWinner(title :String ,joueur:String){
        let alert = UIAlertController(title: title, message: joueur + " a gagné", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) { (action) in
            for button in self.buttons{
                button.setImage(UIImage(named: "help"), for: .normal)
            }
                self.circle = true
                self.AdjustToWhoTheTurnLabel()
        }
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    func CheckIfYouWin(){
        if  (button1.image(for: .normal) != UIImage(named: "help")
            && button1.image(for: .normal) == button2.image(for: .normal)
            && button1.image(for: .normal) == button3.image(for: .normal))
            ||
            (button4.image(for: .normal) != UIImage(named: "help")
            && button4.image(for: .normal) == button5.image(for: .normal)
            && button4.image(for: .normal) == button6.image(for: .normal))
            ||
            (button7.image(for: .normal) != UIImage(named: "help")
            && button7.image(for: .normal) == button8.image(for: .normal)
            && button7.image(for: .normal) == button9.image(for: .normal))
            ||
            (button1.image(for: .normal) != UIImage(named: "help")
            && button1.image(for: .normal) == button4.image(for: .normal)
            && button1.image(for: .normal) == button7.image(for: .normal))
            ||
            (button2.image(for: .normal) != UIImage(named: "help")
            && button2.image(for: .normal) == button5.image(for: .normal)
            && button2.image(for: .normal) == button8.image(for: .normal))
            ||
            (button3.image(for: .normal) != UIImage(named: "help")
            && button3.image(for: .normal) == button6.image(for: .normal)
            && button3.image(for: .normal) == button9.image(for: .normal)
            )
            ||
            (
            button1.image(for: .normal) != UIImage(named: "help")
            && button1.image(for: .normal) == button5.image(for: .normal)
            && button1.image(for: .normal) == button9.image(for: .normal)
            )
            ||
            (
            button3.image(for: .normal) != UIImage(named: "help")
            && button3.image(for: .normal) == button5.image(for: .normal)
            && button3.image(for: .normal) == button7.image(for: .normal))
        {
            if circle {
                ShowTheWinner(title: "WIN", joueur: "Joueur 1" )
            }else {
                ShowTheWinner(title: "WIN", joueur: "Joueur 2")
            }
            
        }else {
            if checkIfMovePossible(){
                if circle {
                    circle = false
                }else {
                    circle = true
                }
                AdjustToWhoTheTurnLabel()
            }else {
                ShowTheWinner(title: "You LOOSE", joueur: "Aucun joueur ")
            }
           
        }
    }
    
    func checkIfMovePossible() -> Bool {
        for button in buttons {
            if button.image(for: .normal) == UIImage(named: "help"){
                return true
            }
        }
        return false
    }

    
  
    
}



