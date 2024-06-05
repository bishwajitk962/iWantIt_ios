//
//  TermsAndConditionVC.swift
//  iWantIT
//
//  Created by Supriyo Dey on 05/06/24.
//

import UIKit

class TermsAndConditionVC: UIViewController {
    @IBOutlet weak var txtTandC: UITextView!
    @IBOutlet weak var lblNavTitle: UILabel!
    
    var navType: String = "T"
    
    let tnc = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Rhoncus dolor purus non enim praesent elementum facilisis. Quis vel eros donec ac odio tempor orci. Proin libero nunc consequat interdum varius sit amet mattis vulputate. Vestibulum lorem sed risus ultricies tristique. Sed turpis tincidunt id aliquet risus. Bibendum arcu vitae elementum curabitur vitae. Volutpat est velit egestas dui. Diam vel quam elementum pulvinar etiam. A erat nam at lectus urna duis convallis convallis tellus. Facilisi cras fermentum odio eu. Convallis aenean et tortor at risus viverra adipiscing at in. Consequat nisl vel pretium lectus quam id leo in vitae. At augue eget arcu dictum varius duis at consectetur. Ullamcorper eget nulla facilisi etiam. Venenatis lectus magna fringilla urna porttitor. Vel turpis nunc eget lorem dolor sed viverra. Sit amet tellus cras adipiscing enim eu.\n\nViverra aliquet eget sit amet tellus cras adipiscing enim eu. Id consectetur purus ut faucibus pulvinar elementum. A iaculis at erat pellentesque adipiscing commodo. Sed vulputate odio ut enim blandit volutpat maecenas volutpat blandit. Lobortis feugiat vivamus at augue. Dui ut ornare lectus sit amet est placerat in egestas. At erat pellentesque adipiscing commodo. Sodales ut eu sem integer vitae. Varius quam quisque id diam. In vitae turpis massa sed. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Aliquam ultrices sagittis orci a scelerisque purus. Tempus quam pellentesque nec nam aliquam. At elementum eu facilisis sed odio morbi. Sapien nec sagittis aliquam malesuada bibendum arcu vitae. Sed sed risus pretium quam vulputate dignissim suspendisse in.\n\nDignissim convallis aenean et tortor. Ut pharetra sit amet aliquam. Est sit amet facilisis magna etiam tempor. Vitae nunc sed velit dignissim sodales ut. Ultrices tincidunt arcu non sodales neque sodales ut etiam sit. Erat nam at lectus urna duis. Leo duis ut diam quam nulla porttitor massa id neque. Feugiat in fermentum posuere urna nec. Mauris a diam maecenas sed enim ut sem. Sit amet luctus venenatis lectus magna fringilla urna porttitor. Et leo duis ut diam quam nulla porttitor massa id. Ultrices in iaculis nunc sed augue lacus viverra vitae.\n\nPulvinar etiam non quam lacus suspendisse faucibus interdum posuere lorem. In pellentesque massa placerat duis ultricies. Rhoncus aenean vel elit scelerisque. Maecenas ultricies mi eget mauris pharetra et ultrices neque ornare. Egestas diam in arcu cursus euismod. Imperdiet proin fermentum leo vel orci porta. Nec ullamcorper sit amet risus nullam eget. Magna ac placerat vestibulum lectus. Ut sem viverra aliquet eget sit amet tellus. Tempus urna et pharetra pharetra massa massa ultricies mi.\n\nTristique magna sit amet purus gravida quis blandit turpis cursus. Cras tincidunt lobortis feugiat vivamus at. Egestas egestas fringilla phasellus faucibus scelerisque eleifend donec pretium. Mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Urna duis convallis convallis tellus id interdum velit. Euismod quis viverra nibh cras pulvinar mattis. Maecenas ultricies mi eget mauris pharetra et. Sed sed risus pretium quam. Id cursus metus aliquam eleifend mi in. Fames ac turpis egestas maecenas pharetra. Mus mauris vitae ultricies leo integer. Ipsum a arcu cursus vitae congue mauris. Feugiat in fermentum posuere urna nec tincidunt praesent semper."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtTandC.text = tnc
        if navType == "T" {
            lblNavTitle.text = "Terms and Condition"
        } else if navType == "P" {
            lblNavTitle.text = "Privacy Policy"
        }
        
    }
    @IBAction func backBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

