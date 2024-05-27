import Foundation
import Combine
import CoreLocation
import MapKit

class LocationReminderViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194), // Example: San Francisco
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    @Published var reminders = [Reminder]()
    
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
        requestLocationPermissions()
    }
    
    private func requestLocationPermissions() {
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func addReminder(text: String) {
        let center = region.center
        let reminder = Reminder(title: text, coordinate: center)
        reminders.append(reminder)
        
        let geofence = CLCircularRegion(center: center, radius: 100, identifier: reminder.id.uuidString)
        geofence.notifyOnEntry = true
        geofence.notifyOnExit = true
        locationManager.startMonitoring(for: geofence)
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        // Handle entry notification
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        // Handle exit notification
    }
}
