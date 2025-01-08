//
//  UnsplashAPI.swift
//  Unsplash
//
//  Created by FLEURY on 07/01/2025.
//

import Foundation

struct UnsplashAPI {
    
    let scheme = "https";
    let host = "api.unsplash.com";
    
    let apiKey = "TmHdoMzqSt_x3dljIgdvsfCdcvN0OYNvtE3B1ppIWRY";
    

    // Construit un objet URLComponents avec la base de l'API Unsplash
    // Et un query item "client_id" avec la clé d'API retrouvé depuis PListManager
    func unsplashApiBaseUrl() -> URLComponents {
        var components = URLComponents()

        components.scheme = scheme
        components.host = host
        
        components.queryItems = [
                        URLQueryItem(name: "client_id", value: apiKey)
                    ]
        
        return components

    }

    
    

    // Par défaut orderBy = "popular" et perPage = 10 -> Lisez la documentation de l'API pour comprendre les paramètres, vous pouvez aussi en ajouter d'autres si vous le souhaitez
    // per_page    Number of items per page. (Optional; default: 10)
    func feedUrl(orderBy: String = "popular", perPage: Int = 10) -> URL? {

        var components = unsplashApiBaseUrl()
        components.path = "/photos";
        
        // Créer un tableau si URLQueryItem existe
        var queryItems: [URLQueryItem] = components.queryItems ??  []
        
        // Créer un query item "Popular" dans l'url
        let queryItemOrderby = URLQueryItem(name: "order_by", value: orderBy);
        
        // Créer un query item "perPage" dans l'url
        let queryItemPerPage = URLQueryItem(name: "per_page", value: "\(perPage)");
        
        
        components.queryItems = queryItems;
        
        
        return components.url
    }
    
    func topicFeedUrl(perPage: Int = 10) -> URL? {
        var components = unsplashApiBaseUrl()
        components.path = "/topics"
        
        var queryItems: [URLQueryItem] = components.queryItems ?? []
        let queryItemPerPage = URLQueryItem(name: "per_page", value: "\(perPage)")
        
        queryItems.append(queryItemPerPage)
        components.queryItems = queryItems
        
        return components.url
    }
    
    func topicPhotosUrl(topicId: String, perPage: Int = 10, page: Int = 1) -> URL? {
            var components = unsplashApiBaseUrl()
            components.path = "/topics/\(topicId)/photos"
            
            components.queryItems = [
                URLQueryItem(name: "client_id", value: apiKey),
                URLQueryItem(name: "per_page", value: "\(perPage)"),
                URLQueryItem(name: "page", value: "\(page)")
            ]
            
            return components.url
        }
}

