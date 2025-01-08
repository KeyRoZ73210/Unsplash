//
//  ContentView.swift
//  Unsplash
//
//  Created by FLEURY on 25/12/2024.
//

import SwiftUI
import Foundation

struct ContentView: View {
    
    // permet d’indiquer au framework que notre vue dépend de cet objet et qu’il doit être conservé en mémoire tant que la vue est affichée.
    @StateObject var feedState = FeedState()
    
    // Créer les colonnes 2 GridItem = 2 colonnes
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Button(action: {
                        Task {
                            await feedState.fetchHomeFeed()
                            await feedState.fetchFeaturedTopics()
                        }
                    }, label: {
                        Text("Load...")
                    })
                }
                ScrollView(.horizontal) {
                    HStack(spacing: 10) {
                        
                        if let TopicsList = feedState.topics {
                            ForEach(TopicsList, id: \.self) { topic in
                                NavigationLink(destination: TopicFeedView(topic: topic)) {
                                    VStack {
                                        if let url = URL(string: topic.coverPhoto.urls.small) {
                                            AsyncImage(url: url) { image in
                                                image.resizable()
                                                    .scaledToFill()
                                                    .frame(width: 120, height: 80)
                                                    .cornerRadius(8)
                                                    .clipped()
                                            } placeholder: {
                                                ProgressView()
                                                    .progressViewStyle(CircularProgressViewStyle())
                                                    .frame(width: 50, height: 50)
                                            }
                                            Text(topic.title)
                                                            .font(.caption)
                                                            .foregroundColor(.primary)
                                                            .frame(width: 120)
                                                            .lineLimit(1)
                                        }
                                    }
                                }
                            }
                        }
                        
                        
                    }
                }.padding(18)
                VStack {
                    ScrollView {
                        if feedState.isLoading { placeholderGrid
                                .redacted(reason: .placeholder)
                        } else if let ImageList = feedState.homeFeed {
                            LazyVGrid(columns: columns) {
                                ForEach(ImageList, id: \.self) { urlString in
                                        if let url = URL(string : urlString.urls.regular ) {
                                            AsyncImage(url: url) {
                                                image in image.resizable()
                                                    .frame(height: 150)
                                                    .cornerRadius(12)
                                                    .clipped()
                                            } placeholder: {
                                                ProgressView()
                                                    .progressViewStyle(CircularProgressViewStyle())
                                                    .frame(width: 50, height: 50)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }.navigationTitle("Feed")
            }
        }
        private var placeholderGrid: some View {
            LazyVGrid(columns: columns) {
                ForEach(0..<12) { _ in
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 150)
                }
            }
            .padding(.horizontal)
        }
}
#Preview {
    ContentView()
}
