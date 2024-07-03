//
//  AppCache.swift
//  Whetness
//
//  Created by Bishwajit kumar on 12/12/23.
//  Copyright © 2020 Kamaljeet Punia. All rights reserved.
//

import UIKit

var currentController: UIViewController {
    return RootControllerProxy.shared.detectCurrentController()
}

class AppCache: NSObject {
    
    static let shared = AppCache()
    
    
    // MARK: - CLASS LIFE CYCLE
    private override init() {
        super.init()
    }
    
    // MARK: - VARIABLES
    var isBiometricAvailable = true
    var userToken = ""
    
    var currentUser: UserDataModel? {
        set {
            if let data = JSONEncoder().convertToData(newValue) {
                UserDefaults.standard.setValue(data, forKey: AppConstants.UserDefault.currentUser)
                UserDefaults.standard.synchronize()
            }
        }
        get {
            if let data = UserDefaults.standard.data(forKey: AppConstants.UserDefault.currentUser) {
                return JSONDecoder().convertDataToModel(data)
            }
            return nil
        }
    }
//    var getUserDetailData: GetUserDetailData? {
//        set {
//            if let data = JSONEncoder().convertToData(newValue) {
//                UserDefaults.standard.setValue(data, forKey: AppConstants.UserDefault.getUserDetailData)
//                UserDefaults.standard.synchronize()
//            }
//        }
//        get {
//            if let data = UserDefaults.standard.data(forKey: AppConstants.UserDefault.getUserDetailData) {
//                return JSONDecoder().convertDataToModel(data)
//            }
//            return nil
//        }
//    }
    
//    var phone: Phone? {
//        set {
//            if let data = JSONEncoder().convertToData(newValue) {
//                UserDefaults.standard.setValue(data, forKey: AppConstants.UserDefault.phone)
//                UserDefaults.standard.synchronize()
//            }
//        }
//        get {
//            if let data = UserDefaults.standard.data(forKey: AppConstants.UserDefault.phone) {
//                return JSONDecoder().convertDataToModel(data)
//            }
//            return nil
//        }
//    }
    
    var token: String {
        return self.currentUser?.loginToken ?? ""
    }
        
    func removeAllUserDefaults() {
        
        var user_Mail = ""
        var user_Password = ""
        var remember_Me = ""
        
        if let userMail = UserDefaultsManager.shared.getValue(forKey: .userMail) as? String {
            print("userMail: \(userMail)")
            user_Mail = userMail
        } else {
            print("userMail not found")
        }
        
        if let userPassword = UserDefaultsManager.shared.getValue(forKey: .userPassword) as? String {
            print("userPassword: \(userPassword)")
            user_Password = userPassword
        } else {
            print("userPassword not found")
        }
        
        if let rememberMe = UserDefaultsManager.shared.getValue(forKey: .rememberMe) as? String {
            print("rememberMe: \(rememberMe)")
            remember_Me = rememberMe
        } else {
            print("rememberMe not found")
        }
        
        
        if let domain = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: domain)
            UserDefaults.standard.synchronize()
        }
        
        UserDefaultsManager.shared.saveValue(user_Mail, forKey: .userMail)
        UserDefaultsManager.shared.saveValue(user_Password, forKey: .userPassword)
        UserDefaultsManager.shared.saveValue(remember_Me, forKey: .rememberMe)
    }
    
    static func getFromDB<T : Decodable>(key: String) -> T? {
        if let blogData = UserDefaults.standard.data(forKey: key),
            let blog = try? JSONDecoder().decode(T.self, from: blogData) {
            return blog
        }
        return nil
    }
    
}
