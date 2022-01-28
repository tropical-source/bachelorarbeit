//
//  ContentView.swift
//  Shared
//
//  Created by Georg Hans on 15

import Foundation
import SwiftUI

struct ContentView: View {
    //@ObservedObject var fetch = FetchToDo()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                NavigationLink(destination: Test1View()) {
                    Text("Test 1")
                }
                NavigationLink(destination: Test2View()) {
                    Text("Test 2")
                }
            }
            .navigationTitle("Test Suite")
        }
    }
    
    struct Test2View: View {
        @ObservedObject var test2 = Test2()
        var body: some View {
            VStack() {
                Button("Start") {
                    test2.test2()
                }
                Text("Stored " + String(test2.N) + "Key-Value-Pairs in ")
                Text(String(test2.time) + " milliseconds")
            }.navigationTitle("Test 2")
        }
    }
    
    struct Test1View: View {
        @ObservedObject var primesCalculator = PrimesCalculator()
        var body: some View {
            VStack() {
                Button("Start") {
                    primesCalculator.calculatePrimes()
                }
                Text("Calculated " + String(primesCalculator.N) + " primes in milliseconds: " + String(primesCalculator.time))
                Text(primesCalculator.primesString)
            }.navigationTitle("Test 1")
        }
    }
}


//struct ContentView: View {
//    // 1.
//    @ObservedObject var fetch = FetchToDo()
//    @ObservedObject var calculated = CalculatePrimes()
//
//    var body: some View {
//        VStack {
//            List(calculated.p,rimes) { prime in
//                Text(prime)
//            }
//            // 2.
//            List(fetch.todos) { todo in
//                VStack(alignment: .leading) {
//                    // 3.
//                    Text(todo.title)
//                    Text("\(todo.completed.description)") // print boolean
//                        .font(.system(size: 11))
//                        .foregroundColor(Color.gray)
//                }
//            }
//        }
//    }
//}
