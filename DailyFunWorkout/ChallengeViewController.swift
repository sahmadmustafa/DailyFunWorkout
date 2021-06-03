//
//
//  Created by Hassan on 3/28/19.
//  Copyright © 2019 Ahmad Mustafa. All rights reserved.
//


import Foundation
import UIKit


struct ScreenSize {
    static let width = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.size.height
    static let maxLength = max(ScreenSize.width, ScreenSize.height)
    static let minLength = min(ScreenSize.width, ScreenSize.height)
    static let frame = CGRect(x: 0, y: 0, width: ScreenSize.width, height: ScreenSize.height)
}

struct DeviceType11 {
    static let iPhone4orLess = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength < 568.0
    static let iPhone5orSE = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength == 568.0
    static let iPhone678 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength == 667.0
    static let iPhone678p = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength == 736.0
    static let iPhoneX = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength == 812.0
    
    static let IS_IPAD              = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.maxLength == 1024.0
    static let IS_IPAD_PRO          = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.maxLength == 1366.0
}


class ChallengeViewController: UIViewController {
    
    //  Converted to Swift 4 by Swiftify v4.2.23831 - https://objectivec2swift.com/
   
//     var  strMain: NSString! = ""
  //  strMain
    var strMain: NSString = ""
    var name:String = ""
//    var variable: Int = 0
    @IBOutlet var lblTitle: UILabel!

    @IBOutlet var btnNxt: UIButton!
    @IBOutlet var Vwbuttons: UIStackView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let alert = UIAlertController(title: "IMPORTANT", message: "20 DAY DAILY WORKOUT WILL HELP YOU OUT TOWARDS HEALTHY LIFE", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
            case .default:
                print("default")
                
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
                
                
            }}))
        self.present(alert, animated: true, completion: nil)
        
        
        
        
        if(strMain=="0")
        {
            lblTitle.text="SKINNT TONED ARMS"
        }
        else if(strMain=="1")
        {
            lblTitle.text="SEXY LEGS & BUTT"
        }
        else if(strMain=="2")
        {
            lblTitle.text="FULL BODY"
        }
        else if(strMain=="3")
        {
            lblTitle.text="BIKINI BODY"
        }
        else if(strMain=="4")
        {
            lblTitle.text="ABS & FLAT TUMMY"
        }



        
   //     lblTitle.text=strMain as! String
        // Do any additional setup after loading the view.
        
        //    [self ReshapeButton];
     
//        loadButtonDays()
      
    //    Vwbuttons.setCustomSpacing(10.0, after: Vwbuttons.subviews[0])

    }
    
    
    @objc func buttonClicked(sender : UIButton)
    {
//        let alert = UIAlertController(title: "Clicked", message: "You have clicked on the button", preferredStyle: .alert)
//
//        self.present(alert, animated: true, completion: nil)
   
        print("The button title is \(sender.titleLabel?.text ?? "")")

    }
    
    
    
   override func viewWillAppear(_ animated: Bool)
   {
        super.viewWillAppear(true)
    
    loadButtonDays()

    self.navigationController?.isNavigationBarHidden=false
    self.title="GET READY"
    
    if(DeviceType11.iPhone5orSE)
    {
        print("SE")
    }
    else if(DeviceType11.iPhoneX)
    {
        print("iPhoneX")
    }
    
    
    let value1: Int = UserDefaults.standard.integer(forKey: "DayNumber")
    
    if(value1==20)
    {
//        UserDefaults.standard.set(1, forKey: "DayNumber")
        let alertController = UIAlertController(title: "", message: "You have completed your 20 Days Daily Fun Workout", preferredStyle: .alert)
        
        let action3 = UIAlertAction(title: "OK", style: .destructive) { (action:UIAlertAction) in
            print("You've pressed the destructive");
//            self.navigationController?.popToRootViewController(animated: true)
            UserDefaults.standard.set(0, forKey: "DayNumber")
            
        }
        
        alertController.addAction(action3)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    }
    
    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
    }
    
    /*
     #pragma mark - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    @IBAction func backButton(_ sender: Any)
    {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func startDay1(_ sender: Any)
    {
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let controlVC = mainStoryboard.instantiateViewController(withIdentifier: "StartWorkoutViewController") as? StartWorkoutViewController
        
        if let controlVC = controlVC {
            self.navigationController?.pushViewController(controlVC, animated: true)
        }
        
        /*
         
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)

        let controlVC = mainStoryboard.instantiateViewController(withIdentifier: "IndividualDayViewController") as? IndividualDayViewController

        if let controlVC = controlVC {
            navigationController?.pushViewController(controlVC, animated: true)
        }
        //    [self.navigationController popViewControllerAnimated:YES];
    
        */
        
    }
    
    func reshapeButton()
    {
        btnNxt.layer.cornerRadius = btnNxt.frame.size.height / 2.0
    }
    
    func loadButtonDays()
    {
       
        var value1: Int = UserDefaults.standard.integer(forKey: "DayNumber")

        
        let arrayOfVillains = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16","17","18","19","20"]
        
        
        
        var buttonY: CGFloat = 180  // our Starting Offset, could be 0
        var buttonX: CGFloat = 30  // our Starting Offset, could be 0
        
        
        
//        let deviceIdiom = UIScreen.main.traitCollection.userInterfaceIdiom
//
//        switch (deviceIdiom) {
//
//        case .pad:
//            buttonX = 20
//            print("iPad style UI")
//        case .phone:
//            print("iPhone and iPod touch style UI")
//        case .tv:
//            print("tvOS style UI")
//        default:
//            print("Unspecified UI idiom")
//        }
//        buttonX = 10
//
//        if (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad)
//        {
//            print("Ipaddddd")
//
//            // Ipad
//        }
//        else
//        {
//            // Iphone
//        }
        
        
        
        if ( UIDevice.current.model.range(of: "iPad") != nil)
        {
            print("I AM IPAD")
            buttonX = 10
            
        }
        else
        {
            print("I AM IPHONE")
        }
        
        
        
        var index: CGFloat = 1
        for villain in arrayOfVillains
        {
            
            
            let villainButton = UIButton(frame: CGRect(x: buttonX, y: buttonY, width: 50, height: 50))
            
            buttonX = buttonX + 60

            if index .truncatingRemainder(dividingBy: 6)  == 0
            {
                buttonY = buttonY + 60  // we are going to space these UIButtons 50px apart
                buttonX = 30

                if ( UIDevice.current.model.range(of: "iPad") != nil)
                {
                    print("I AM IPAD")
                    buttonX = 10
                    
                }
                else
                {
                    print("I AM IPHONE")
                }
                
//                buttonX = 10

//                if(UIDevice.Type==iPhone_5_5S_5C)
//                {
//                    buttonX = 20
//                }
               
                
                
                
            }
            
            if(value1>=Int(index))
            {
                villainButton.titleLabel?.text = ""
                villainButton.setImage(UIImage.init(named:"14946.png"), for: .normal)
                
                //villainButton.backgroundImage(for: .normal) = UIImage.init(named:"checknow11.png")
                
            }
            
            
            index = index + 1
            //}
            
            villainButton.layer.cornerRadius = 25  // get some fancy pantsy rounding
            villainButton.backgroundColor = UIColor.lightGray
            villainButton.setTitle("\(villain)", for: UIControl.State.normal) // We are going to use the item name as the Button Title here.
            villainButton.titleLabel?.text = "\(villain)"
            villainButton.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        
            
          
            
            self.view.addSubview(villainButton)
        }
    }
    
}
public extension UIDevice {
    
    public enum `Type` {
        case iPad
        case iPhone_unknown
        case iPhone_5_5S_5C
        case iPhone_6_6S_7_8
        case iPhone_6_6S_7_8_PLUS
        case iPhone_X_Xs
        case iPhone_Xs_Max
        case iPhone_Xr
    }
    
    public var hasHomeButton: Bool {
        switch type {
        case .iPhone_X_Xs, .iPhone_Xr, .iPhone_Xs_Max:
            return false
        default:
            return true
        }
    }
    
    public var type: Type {
        if userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 1136:
                return .iPhone_5_5S_5C
            case 1334:
                return .iPhone_6_6S_7_8
            case 1920, 2208:
                return .iPhone_6_6S_7_8_PLUS
            case 2436:
                return .iPhone_X_Xs
            case 2688:
                return .iPhone_Xs_Max
            case 1792:
                return .iPhone_Xr
            default:
                return .iPhone_unknown
            }
        }
        return .iPad
    }
}
