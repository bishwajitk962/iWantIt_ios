//
//  UserModel.swift
//  Colorblind
//
//  Created by Bishwajit kumar on 12/12/23.
//

import Foundation

// MARK: - DataClass
struct UserDataModel: Codable {
    var id: Int?
    var name: String?
    var profileName, firstName, lastName: String?
    var email: String?
    var countryCode, contactNo, emailVerifiedAt: String?
    var role: String?
    var remember, currentTeamID, profilePhotoPath, bannerImage: String?
    var headShot, fullBody: String?
    var status: Int?
    var abouts: String?
    var privacyPolicy, isAge: Int?
    var wallet: String?
    var categoryID: Int?
    var createdAt, updatedAt, customerID: String?
    var accountID: String?
    var loginToken: String?
    var profilePhotoURL: String?
    

    enum CodingKeys: String, CodingKey {
        case id, name
        case profileName = "profile_name"
        case firstName = "first_name"
        case lastName = "last_name"
        case email
        case countryCode = "country_code"
        case contactNo = "contact_no"
        case emailVerifiedAt = "email_verified_at"
        case role, remember
        case currentTeamID = "current_team_id"
        case profilePhotoPath = "profile_photo_path"
        case bannerImage = "banner_image"
        case headShot = "head_shot"
        case fullBody = "full_body"
        case status, abouts
        case privacyPolicy = "privacy_policy"
        case isAge = "is_age"
        case wallet
        case categoryID = "category_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case customerID = "customer_id"
        case accountID = "account_id"
        case loginToken
        case profilePhotoURL = "profile_photo_url"
    }
}

//// MARK: - OnboardNew
//struct UserDataModel: Codable {
//    let phone: UserPhone
//    let referralCode, email, dateOfBirth, userName: String
//    let name: CustomerName
//    let password, transactionPin: String
//}
//
//// MARK: - Name
//struct CustomerName: Codable {
//    let first: String
//}
//
//// MARK: - Phone
//struct UserPhone: Codable {
//    let countryCode, phoneNumber, countryCodeISO: String
//
//    enum CodingKeys: String, CodingKey {
//        case countryCode, phoneNumber
//        case countryCodeISO = "countryCodeIso"
//    }
//}
// MARK: - GetUserDetail
struct GetUserDetail: Codable {
    var status: Int?
    var message: String?
    var data: GetUserDetailData
}

// MARK: - GetUserDetailData
struct GetUserDetailData: Codable {
    var existingUser: ExistingUser
    var languages: [Role]
    var currency: [Currency]
    var govtIDS: [Role]
    var additionalData: AdditionalData

    enum CodingKeys: String, CodingKey {
        case existingUser, languages, currency
        case govtIDS = "govtIds"
        case additionalData
    }
}

// MARK: - AdditionalData
struct AdditionalData: Codable {
    var data: AdditionalDataData
}

// MARK: - AdditionalDataData
struct AdditionalDataData: Codable {
    var supportInfo: SupportInfo
    var faqs: [FAQ]
}

// MARK: - FAQ
struct FAQ: Codable {
    var question, answer: String
}

// MARK: - SupportInfo
struct SupportInfo: Codable {
    var supportPhone: Int?
    var supportEmail: String?
}

// MARK: - Currency
struct Currency: Codable {
    var type: Int?
    var name, symbol: String?
}

// MARK: - ExistingUser
struct ExistingUser: Codable {
    var id: String?
    var phone: CustomerUserPhone
    var picture: CustomerUserPicture
    var name: CustomerUserName
    var email: Email
    var password, dateOfBirth, transactionPin: String?
    var updatedAt: String?
    var referralCode: String?
    var termsAndConditionsAccepted, privacyAndPolicyAccepted: Bool?
    var accessToken: String?
    var role: Role?
    var balance: Balance?
    var paymentInfo: PaymentInfo
    var preferences: Preferences
    var isActive, isDeleted, isVerifiedByAdmin: Bool?
    var createdAt: String?
    var v: Int?
    var userName: String?
    var qrCode: String?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case phone, picture, name, email, password, dateOfBirth, transactionPin, updatedAt, referralCode, termsAndConditionsAccepted, privacyAndPolicyAccepted, accessToken, role, balance, paymentInfo, preferences, isActive, isDeleted, isVerifiedByAdmin, createdAt
        case v = "__v"
        case userName
        case qrCode
    }
}

// MARK: - Balance
struct Balance: Codable {
    var mainWallet, loyaltyPoints, mainWalletInPreferedCurrency, loyaltyPointsInPreferedCurrency: Int?
}

// MARK: - Email
struct Email: Codable {
    var email: String?
    var emailVerificationStatus: Bool?
}

// MARK: - Name
struct CustomerUserName: Codable {
    var first, last, nick: String?
}

// MARK: - PaymentInfo
struct PaymentInfo: Codable {
    var accNo, upi, creditCard, debitCard: String?

    enum CodingKeys: String, CodingKey {
        case accNo = "acc_no"
        case upi
        case creditCard = "credit_card"
        case debitCard = "debit_card"
    }
}

// MARK: - Phone
struct CustomerUserPhone: Codable {
    var countryCode, countryCodeISO, phoneNumber, phoneOtp: String?
    var phoneOtpExpiry: String?
    var phoneVerificationStatus: Bool?
    var newPhone: CustomerUserNewPhone?

    enum CodingKeys: String, CodingKey {
        case countryCode
        case countryCodeISO = "countryCodeIso"
        case phoneNumber, phoneOtp, phoneOtpExpiry, phoneVerificationStatus
             //newPhone
    }
}

// MARK: - NewPhone
struct CustomerUserNewPhone: Codable {
    var newCountryCode, newCountryCodeISO, newPhoneNumber, newPhoneOtp: String?
    var newPhoneOtpExpiry: String?

    enum CodingKeys: String, CodingKey {
        case newCountryCode
        case newCountryCodeISO = "newCountryCodeIso"
        case newPhoneNumber, newPhoneOtp, newPhoneOtpExpiry
    }
}

// MARK: - Picture
struct CustomerUserPicture: Codable {
    var selfie, profilePic: String?
}

// MARK: - Preferences
struct Preferences: Codable {
    var email, sms, push, transferSuccess: Bool?
    var promoTransactions: Bool?
    var language, currency: Int?
}

// MARK: - Role
struct Role: Codable {
    var name: String?
    var type: Int?
}



