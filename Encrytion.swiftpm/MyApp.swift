import SwiftUI

@main
@available(iOS 17.0, *)
struct MyApp: App {
    @StateObject var settings = Settings(CaesersShift: 0, CaesersAlphabet: Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ"))
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(settings)
            //CaesarView(text: "Hello WWDC")
                //.environmentObject(settings)
        }
    }
}
