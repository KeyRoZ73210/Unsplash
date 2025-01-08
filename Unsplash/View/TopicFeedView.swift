//
//  TopicFeedView.swift
//  Unsplash
//
//  Created by FLEURY on 07/01/2025.
//

import SwiftUI

struct TopicFeedView: View {
    @StateObject var topicState = FeedState()
    var topic: UnsplashTopic
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if topicState.isLoading {
                    ProgressView("Chargement des photos...")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else if topicState.topicPhotos.isEmpty {
                    Text("Aucune photo disponible pour ce topic.")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(topicState.topicPhotos) { photo in
                            if let url = URL(string: photo.urls.regular) {
                                AsyncImage(url: url) { image in
                                    image.resizable()
                                        .scaledToFill()
                                        .frame(height: 150)
                                        .cornerRadius(12)
                                        .clipped()
                                } placeholder: {
                                    ProgressView()
                                        .frame(width: 100, height: 100)
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle(topic.title)
            .task {
                await topicState.fetchPhotosForTopic(topicId: topic.id)
            }
        }
    }
}
