import SwiftUI
import shared

struct ContentView: View {
    
    @ObservedObject var viewModel: ContentViewModel
    
    var body: some View {
        VStack {
            Text("Recipes list")
                .font(.largeTitle)
            TextField("Search ingredients", text: $viewModel.searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 10)
            List(self.viewModel.recipes) { item in
                VStack(alignment: .leading, spacing: 10) {
                    Text(item.mainTitle)
                        .font(.headline)
                    Text("Ingredients: \(item.ingredientsList)")
                    Button(action: {
                        if let url = URL(string: item.href) {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        Text("List: \(item.href)")
                        .font(.footnote)
                        .foregroundColor(Color.blue)
                    }
                    
                }.padding(.vertical, 10)
            }
        }.onAppear {
            self.viewModel.fetch()
        }
    }
}
