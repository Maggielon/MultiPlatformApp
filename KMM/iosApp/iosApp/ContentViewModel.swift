//
//  ContentViewModel.swift
//  iosApp
//
//  Created by Анастасия on 04.01.2021.
//  Copyright © 2021 orgName. All rights reserved.
//

import Combine
import shared

final class ContentViewModel: ObservableObject {
    
    @Published var searchText: String = ""
    @Published var recipes: [Recipe] = []
    
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        $searchText.removeDuplicates()
            .debounce(for: .milliseconds(500), scheduler: DispatchQueue.main)
            .sink { _ in
                self.fetch()
            }.store(in: &subscriptions)
    }
    
    func fetch() {
        ListViewModel().list(ingredients: searchText, query: "", page: 1, completionHandler: { list, error  in
            self.recipes = list?.results ?? []
        })
    }
}

extension Recipe: Identifiable {
    
    public var id: String {
        href
    }
    
    public var mainTitle: String {
        title ?? ""
    }
    
    public var ingredientsList: String {
        ingredients ?? ""
    }
}
