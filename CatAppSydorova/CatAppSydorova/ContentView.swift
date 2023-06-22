//
//  ContentView.swift
//  CatAppSydorova
//
//  Created by лізушка лізушкіна on 26.05.2023.
//

import SwiftUI
import Networking
import FirebaseCrashlytics


struct ContentView: View {
    @AppStorage("CrashAnalytics") var crashAnalytics:Bool = true
    @State private var showAlert = false
    @State private var selectedCat: String = ""
    let cats = createCats()
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 10) {
                    Text("Funny Animals")
                        .font(.title2)
                    ForEach(cats) { cat in
                        NavigationLink(destination: CatDetailsView(exactCat: cat)) {
                            CatCellView(exactCat: cat)
                        }
                        .onAppear {
                            selectedCat = cat.name
                            logUserAction(selectedCat)
                        }
                        
                    }
                    Button("Crash") {
                        fatalError("Crash was triggered")
                    }
                }
                
                .padding(10)
            }
        }
        .onAppear{
            if !crashAnalytics
            {
                showAlert = true
            }
        }
        .alert(isPresented: $showAlert)
        {
            Alert(title: Text("Do you agree to send your crash data? (It will improve my app bro)"),
                  primaryButton: .default(Text("Sure, bro"), action: {
                crashAnalytics = true
                turnCrashAnCollection(crashAnalytics)
            }),
                  secondaryButton: .cancel{
                crashAnalytics=true
                turnCrashAnCollection(false)
            })
        }
    }
}

func logUserAction(_ action: String) {
    Crashlytics.crashlytics().setCustomValue(action, forKey: "UserAction")
    Crashlytics.crashlytics().log("User performed action: \(action)") 
    Crashlytics.crashlytics().sendUnsentReports()
}

private func turnCrashAnCollection(_ state :Bool)
{
    if state{
        Crashlytics.crashlytics().setCrashlyticsCollectionEnabled(true)
    }
    else
    {
        Crashlytics.crashlytics().setCrashlyticsCollectionEnabled(false)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
