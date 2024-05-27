//
//  Reminder.swift
//  GeoPromoAlert
//
import Foundation
import CoreLocation

struct Reminder: Identifiable, Hashable {
    let id: UUID
    let title: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, coordinate: CLLocationCoordinate2D) {
        self.id = UUID()
        self.title = title
        self.coordinate = coordinate
    }
    
    static func == (lhs: Reminder, rhs: Reminder) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
