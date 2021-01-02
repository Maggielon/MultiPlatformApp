import SwiftUI
import shared

func greet() -> String {
    return Greeting().greeting()
}

struct ContentView: View {
    
    @State var recipes: [Recipe] = []
    
    var body: some View {
        VStack {
            Text(greet())
            List(self.recipes) { item in
                Text(item.id)
            }
        }.onAppear {
            ListViewModel().list(ingredients: "lattuce", query: "", page: 1, completionHandler: { list, error  in
                self.recipes = list?.results ?? []
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Recipe: Identifiable {
    
    public var id: String {
        href
    }
}
