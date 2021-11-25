import UIKit

enum socialPlatforms: String, CaseIterable {
    case twitter = "Never used it"
    case facebook = "Sucks"
    case instagram = "So hot"
    case cyworld = "Old man"
    case budybudy = "Dead man"
}

func getSNS(on platforms: socialPlatforms) {
    switch platforms {
    case .budybudy:
        print("Code something on it Budybudy")
    case .twitter:
        print("Code something on it Twitter")
    case .facebook:
        print("Code something on it Facebook")
    case .instagram:
        print("Code something on it Instagram")
    case .cyworld:
        print("Code something on it Cyworld")
    }
}



//func getSamsOpinion(on platform: socialPlatforms) {
//    print(platform.rawValue)
//}
//
//getSNS(on: .twitter)
//getSamsOpinion(on: .twitter)
//
//for platforms in socialPlatforms.allCases {
//    print("\(platforms.hashValue)_hash : \(platforms.rawValue)_raw")
//}


enum SocialMediaPlatform {
    case youtube(subscriber: Int)
    case instagram(liked: Int)
    case linkedIn
    case naver
}

func getSponsorship(for platform: SocialMediaPlatform) {
    switch platform {
    case .instagram(let subscribers) where subscribers > 10_000:
        print("Elegible for sponsored Instagram.")
    case .youtube(let liked) where liked > 20_000:
        print("Elegible for sponsored Youtube.")
    case .instagram, .linkedIn, .naver, .youtube:
        print("Not Elegible for spornsorship.")
    }
}


getSponsorship(for: .youtube(subscriber: 5))
getSponsorship(for: .instagram(liked: 40000))
