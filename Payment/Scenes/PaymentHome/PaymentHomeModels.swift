//
//  PaymentHomeModels.swift
//  Payment
//
//  Created by ARPIT  SRIVASTAVA on 03/12/18.
//  Copyright (c) 2018 Arpit. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol Identifiable {
    var identifier: String { get }
}

protocol SectionIdentifiable {
    var sectionIdentifier: SectionType { get }
}

enum SectionType: String {
    case card
    case wallet
    case otherwallet
    case netbank
    case upi
}

enum PaymentHome {
    // MARK: Use cases
    
    enum PaymentOptions {
        struct Request {
            var isNetworkFetch = true
            var selectedCardIndex = -1
        }
        struct Response {
            struct NetbankingResponse {
                struct PreferredResponse {
                    var priority: Int
                    var logo: String
                    var code: String
                    var name: String
                }
                var pg: String
                var preferred: [PreferredResponse]
                var all: [String: Any]
            }
            struct CardResponse {
                struct SavedCardResponse {
                    var logo: String
                    var number: String
                    var isExpanded: Bool
                }
                var pg: String
                var cards: [SavedCardResponse]
            }
            struct WalletResponse {
                var name: String
                var code: String
                var logo: String
                var pg: String
                var linked: Bool
            }
            struct OtherWalletResponse {
                var name: String
                var code: String
                var logo: String
                var pg: String
            }
            struct UPIResponse {
                var pg: String
            }
            var alertInfo: String
            var alertError: String
            var card: CardResponse?
            var netbanking: NetbankingResponse?
            var wallet: [WalletResponse]
            var otherWallet: [OtherWalletResponse]
            var upi: UPIResponse?
        }
        struct ViewModel {
            struct HeaderViewModel: Identifiable {
                var identifier: String
                var text: String
            }
            struct FooterViewModel: Identifiable {
                var identifier: String
                var text: String
            }
            struct PreferredBanksViewModel: Identifiable {
                struct PreferredBankViewModel {
                    var imageUrl: String
                    var code: String
                    var name: String
                }
                var identifier: String
                var banks: [PreferredBankViewModel]
            }
            struct WalletsViewModel: Identifiable {
                struct WalletViewModel: Identifiable {
                    var identifier: String
                    var imageUrl: String
                    var code: String
                    var name: String
                    var isLinked: Bool
                }
                var identifier: String
                var wallets: [WalletViewModel]
            }
            struct OtherWalletsViewModel: Identifiable {
                struct OtherWalletViewModel {
                    var imageUrl: String
                    var code: String
                    var name: String
                }
                var identifier: String
                var otherWallets: [OtherWalletViewModel]
            }
            struct UPIViewModel: Identifiable {
                var identifier: String
            }
            struct CardsViewModel: Identifiable {
                struct CardViewModel: Identifiable {
                    var identifier: String
                    var imageUrl: String
                    var number: String
                    var isExpanded: Bool
                    var index: Int
                }
                var identifier: String
                var cards: [CardViewModel]
            }
            struct CardSectionViewModel: Identifiable {
                var identifier: String
                var info: [Identifiable]
            }
            struct WalletSectionViewModel: Identifiable {
                var identifier: String
                var info: [Identifiable]
            }
            struct OtherWalletSectionViewModel: Identifiable {
                var identifier: String
                var info: [Identifiable]
            }
            struct NetbankSectionViewModel: Identifiable {
                var identifier: String
                var info: [Identifiable]
            }
            struct UPISectionViewModel: Identifiable {
                var identifier: String
                var info: [Identifiable]
            }
            var summary: [Identifiable]
        }
    }
}

struct ResponseNode {
    struct Netbanking {
        struct Preferred {
            var priority: Int
            var logo: String
            var code: String
            var name: String
        }
        var enabled: Bool
        var pg: String
        var preferred: [Preferred]
        var all: [String: Any]
    }
    struct Card {
        struct SavedCard {
            var logo: String
            var number: String
        }
        var enabled: Bool
        var pg: String
        var cards: [SavedCard]
    }
    struct Wallet {
        var name: String
        var code: String
        var logo: String
        var pg: String
        var linking_enabled: Bool
        var enabled: Bool
        var linked: Bool
    }
    struct UPI {
        var enabled: Bool
        var pg: String
    }
    var alert_info: String
    var alert_error: String
    var card: Card?
    var netbanking: Netbanking?
    var wallet: [Wallet]
    var upi: UPI?
}
