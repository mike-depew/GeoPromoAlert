//
//  ContentView.swift
//  GeoPromoAlert
//
import SwiftUI
import MapKit

struct ContentView: View {
    @StateObject private var viewModel = LocationReminderViewModel()
    @State private var reminderText = ""
    
    var body: some View {
        VStack {
            MapView(region: $viewModel.region, annotations: viewModel.reminders.map {
                let annotation = MKPointAnnotation()
                annotation.coordinate = $0.coordinate
                annotation.title = $0.title
                return annotation
            })
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            
            TextField("Enter reminder", text: $reminderText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                viewModel.addReminder(text: reminderText)
                reminderText = ""
            }) {
                Text("Add Reminder")
            }
            .padding()
            
            ReminderListView(reminders: $viewModel.reminders)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
