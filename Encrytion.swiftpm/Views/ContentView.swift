import SwiftUI


@available(iOS 17.0, *)
struct ContentView: View {
    @EnvironmentObject var settings: Settings
    var body: some View {
//        NavigationStack{
//            VStack {
//                NavigationLink(destination: CaesarView(text: "")) {
//                    Text("Caesar")
//                        .frame(width: 140)
//                        .controlSize(.large)
//                        .padding()
//                        .background(Capsule().foregroundColor(.blue))
//                        .foregroundColor(.white)
//                }
//            }
//        }
        NavigationSplitView {
                    Text("Sidebar")
                } content: {
                    Text("Primary View")
                    List{
                        NavigationLink(destination: CaesarView(text: "")){
                            Text("Caesar")
                        }
                    }
                } detail: {
                    Text("Detail View")
                }
    }
}
