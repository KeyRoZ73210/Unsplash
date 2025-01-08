//
//  Movie.swift
//  Unsplash
//
//  Created by FLEURY on 25/12/2024.
//

import Foundation

let jsonString = """
[
    {
        "id": "4ICax0QMs8U",
        "slug": "a-man-in-a-green-shirt-holding-a-cell-phone-4ICax0QMs8U",
        "description": null,
        "urls": {
            "regular": "https://images.unsplash.com/photo-1720048171098-dba33b2c4806?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w2OTAwODV8MXwxfGFsbHwxfHx8fHx8fHwxNzM1MzAwODUyfA&ixlib=rb-4.0.3&q=80&w=1080"
        },
        "user": {
            "id": "eySMK9KwmJU",
            "first_name": "Samsung",
            "last_name": "Memory"
        }
    },
    {
        "id": "vyHM21rR7mI",
        "slug": "a-woman-in-a-pink-jacket-holding-a-snowboard-vyHM21rR7mI",
        "description": "@Lgnwvr | Lgnwvr.com",
        "urls": {
            "regular": "https://images.unsplash.com/photo-1734366965582-1f5bc9d4e21a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w2OTAwODV8MHwxfGFsbHwyfHx8fHx8fHwxNzM1MzAwODUyfA&ixlib=rb-4.0.3&q=80&w=1080"
        },
        "user": {
            "id": "XFHPUQCLl1o",
            "first_name": "LOGAN",
            "last_name": "WEAVER | @LGNWVR"
        }
    },
    {
        "id": "hh9OkRFj-Pw",
        "slug": "a-field-of-flowers-next-to-a-body-of-water-hh9OkRFj-Pw",
        "description": null,
        "urls": {
            "regular": "https://images.unsplash.com/photo-1734375181552-cfa83d404033?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w2OTAwODV8MHwxfGFsbHwzfHx8fHx8fHwxNzM1MzAwODUyfA&ixlib=rb-4.0.3&q=80&w=1080"
        },
        "user": {
            "id": "9WjlsUEPXi8",
            "first_name": "Hari",
            "last_name": "Nandakumar"
        }
    },
    {
        "id": "OO1n-3Sa6Ag",
        "slug": "a-barbie-doll-riding-a-pink-scooter-next-to-a-barbie-doll-OO1n-3Sa6Ag",
        "description": null,
        "urls": {
            "regular": "https://images.unsplash.com/photo-1734034873537-6a75e0f7aa13?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w2OTAwODV8MHwxfGFsbHw0fHx8fHx8fHwxNzM1MzAwODUyfA&ixlib=rb-4.0.3&q=80&w=1080"
        },
        "user": {
            "id": "anxeWn_nLzw",
            "first_name": "Julee",
            "last_name": "Juu"
        }
    },
    {
        "id": "nDum9PC0wOg",
        "slug": "a-row-of-colorful-buildings-in-a-city-nDum9PC0wOg",
        "description": "Welcome to Lisbon, a fairytale world.",
        "urls": {
            "regular": "https://images.unsplash.com/photo-1733418750591-6b47d7614c7b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w2OTAwODV8MHwxfGFsbHw1fHx8fHx8fHwxNzM1MzAwODUyfA&ixlib=rb-4.0.3&q=80&w=1080"
        },
        "user": {
            "id": "6qLZjXtdAHk",
            "first_name": "Cheng",
            "last_name": "Lin"
        }
    },
    {
        "id": "cN0gHMrDkUc",
        "slug": "a-close-up-of-a-pink-and-yellow-object-cN0gHMrDkUc",
        "description": "Aesthetic wallpaper",
        "urls": {
            "regular": "https://images.unsplash.com/photo-1733433527427-54bd7dc3ebd0?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w2OTAwODV8MHwxfGFsbHw2fHx8fHx8fHwxNzM1MzAwODUyfA&ixlib=rb-4.0.3&q=80&w=1080"
        },
        "user": {
            "id": "cwqwNz1Hwxg",
            "first_name": "Philip",
            "last_name": "Oroni"
        }
    },
    {
        "id": "_crVEAi7JPA",
        "slug": "a-view-from-inside-a-vehicle-of-a-dirt-road-_crVEAi7JPA",
        "description": null,
        "urls": {
            "regular": "https://images.unsplash.com/photo-1732452792153-6d244db8dc01?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w2OTAwODV8MHwxfGFsbHw3fHx8fHx8fHwxNzM1MzAwODUyfA&ixlib=rb-4.0.3&q=80&w=1080"
        },
        "user": {
            "id": "g26zsb-X_r4",
            "first_name": "Kira",
            "last_name": "Laktionov"
        }
    },
    {
        "id": "yQAuEZ6q2yo",
        "slug": "a-desert-landscape-with-rocks-and-plants-in-the-foreground-yQAuEZ6q2yo",
        "description": "Arches National Park",
        "urls": {
            "regular": "https://images.unsplash.com/photo-1731902062648-260a1b5067a0?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w2OTAwODV8MHwxfGFsbHw4fHx8fHx8fHwxNzM1MzAwODUyfA&ixlib=rb-4.0.3&q=80&w=1080"
        },
        "user": {
            "id": "9WFr0B_zGJY",
            "first_name": "Dorina",
            "last_name": "Perry"
        }
    },
    {
        "id": "sALqc-XPwnA",
        "slug": "a-blurry-photo-of-a-white-and-pink-object-sALqc-XPwnA",
        "description": null,
        "urls": {
            "regular": "https://images.unsplash.com/photo-1734216736164-6777c63f862f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w2OTAwODV8MHwxfGFsbHw5fHx8fHx8fHwxNzM1MzAwODUyfA&ixlib=rb-4.0.3&q=80&w=1080"
        },
        "user": {
            "id": "ogQykx6hk_c",
            "first_name": "Pawel",
            "last_name": "Czerwinski"
        }
    },
    {
        "id": "mQ5E7oea5ks",
        "slug": "an-aerial-view-of-a-rocky-landscape-with-trees-mQ5E7oea5ks",
        "description": "Cappadocia. Göreme Historical National Park. Göreme Nevşehir, Türkiye. November 2024. Shot on Sony A7M2, Industar-50-2 50mm f3.5 with Techart LM-EA9 adapter",
        "urls": {
            "regular": "https://images.unsplash.com/photo-1732951363017-caed335fb4ce?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w2OTAwODV8MHwxfGFsbHwxMHx8fHx8fHx8MTczNTMwMDg1Mnw&ixlib=rb-4.0.3&q=80&w=1080"
        },
        "user": {
            "id": "beHH2UOkA80",
            "first_name": "Igor",
            "last_name": "Sporynin"
        }
    }
]

"""


struct UnsplashPhoto: Codable, Hashable, Identifiable {
    let id, slug: String
    let description: String?
    let urls: UnsplashPhotoUrls
    let user: User
    

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    
    static func == (lhs: UnsplashPhoto, rhs: UnsplashPhoto) -> Bool {
        return lhs.id == rhs.id
    }
}

// MARK: - Urls
struct UnsplashPhotoUrls: Codable {
    let regular: String
}

// MARK: - User
struct User: Codable {
    let id, firstName, lastName: String

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
    }
}




typealias MovieAPI = [UnsplashPhoto]


