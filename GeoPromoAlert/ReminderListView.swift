//
//  ReminderListView.swift
//  GeoPromoAlert
//
import SwiftUI

struct ReminderListView: View {
    @Binding var reminders: [Reminder]
    
    var body: some View {
        List(reminders) { reminder in
            ReminderRowView(reminder: reminder)
        }
    }
}
