//
//  FeedState.swift
//  Unsplash
//
//  Created by FLEURY on 07/01/2025.
//

import Foundation
import SwiftUI
import Combine

class FeedState: ObservableObject {
    
    @Published var topics: [UnsplashTopic]?
    @Published var homeFeed: [UnsplashPhoto]?

    @Published var isLoading: Bool = true
    
    @Published var topicPhotos: [UnsplashPhoto] = []
    
    let unsplashAPI = UnsplashAPI()
    
    func fetchHomeFeed() async {
        isLoading = true
        
        // construit l'URL pour récupérer le feed
        guard let urlFeed = unsplashAPI.feedUrl() else {
            print("Impossible de construire l'URL pour le feed.")
            isLoading = false
            return
        }
        do {
            let request = URLRequest(url: urlFeed)
            // Faites l'appel réseau
            let (data, _) = try await URLSession.shared.data(for: request)

            // Transformez les données en JSON
            let deserializedData = try JSONDecoder().decode([UnsplashPhoto].self, from: data)
            
            
            homeFeed = deserializedData
            isLoading = false

        } catch {
            print("Error: \(error)")
            self.isLoading = false
        }
        

    }

    func fetchFeaturedTopics() async {
        isLoading = true
        
        guard let urlTopics = unsplashAPI.topicFeedUrl()  else {
            print("Erreur de création d'URL")
                isLoading = false
            return
        }
        
        do {
            let request = URLRequest(url: urlTopics)
            
            let (data, _) = try await URLSession.shared.data(for: request)
            
            
            let deserializedData = try JSONDecoder().decode([UnsplashTopic].self, from: data)
            
            
            topics = deserializedData
            isLoading = false
        } catch {
            print("Erreur lors de la récupération des topics : \(error)")
            
            
            isLoading = false
        }
    }
    
    func fetchPhotosForTopic(topicId: String) async {
        isLoading = true
        
        guard let url = unsplashAPI.topicPhotosUrl(topicId: topicId) else {
            print("Erreur lors de la création de l'URL pour le topic \(topicId)")
            isLoading = false
            return
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                print("Erreur HTTP : \(httpResponse.statusCode)")
                isLoading = false
                return
            }
            
            print("Réponse reçue : \(String(data: data, encoding: .utf8) ?? "Aucune donnée")")
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let photos = try decoder.decode([UnsplashPhoto].self, from: data)
            topicPhotos = photos
        } catch {
            print("Erreur lors de la récupération des photos : \(error)")
        }
        
        isLoading = false
    }

    
    
    
}
