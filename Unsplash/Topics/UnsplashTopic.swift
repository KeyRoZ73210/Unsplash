// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let unsplashTopic = try? JSONDecoder().decode(UnsplashTopic.self, from: jsonData)

import Foundation

// MARK: - UnsplashTopic
struct UnsplashTopic: Codable, Hashable, Identifiable {
    let id, slug, title, description: String
    let mediaTypes: [String]
    let coverPhoto: CoverPhoto
    let previewPhotos: [PreviewPhoto]

    enum CodingKeys: String, CodingKey {
        case id, slug, title, description
        case mediaTypes = "media_types"
        case coverPhoto = "cover_photo"
        case previewPhotos = "preview_photos"
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    
    static func == (lhs: UnsplashTopic, rhs: UnsplashTopic) -> Bool {
        return lhs.id == rhs.id
    }
}

// MARK: - CoverPhoto
struct CoverPhoto: Codable {
    let id, slug: String
    let urls: Urls
    let assetType: String

    enum CodingKeys: String, CodingKey {
        case id, slug, urls
        case assetType = "asset_type"
    }
}

// MARK: - Urls
struct Urls: Codable {
    let raw, full, regular, small: String
    let thumb, smallS3: String

    enum CodingKeys: String, CodingKey {
        case raw, full, regular, small, thumb
        case smallS3 = "small_s3"
    }
}

// MARK: - User
struct UserTopic: Codable {
    let id, firstName, lastName: String
    let profileImage: ProfileImage

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case profileImage = "profile_image"
    }
}

// MARK: - ProfileImage
struct ProfileImage: Codable {
    let small, medium, large: String
}


// MARK: - Links
struct Links: Codable {
    let linksSelf, html, photos, likes: String
    let portfolio, following, followers: String

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, photos, likes, portfolio, following, followers
    }
}

// MARK: - PreviewPhoto
struct PreviewPhoto: Codable {
    let id, slug: String
    let urls: Urls
}
