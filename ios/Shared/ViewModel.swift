//
//  ViewModel.swift
//  ios-native
//
//  Created by Georg Hans on 15.07.21.
//

import Foundation

struct Todo: Codable, Identifiable {
    public var id: Int
    public var title: String
    public var completed: Bool
}

struct Pair: Codable {
    public var key: String
    public var value: String
}

//struct Data: Codable {
//    public var data: [pair]
//}

class Test2: ObservableObject {
    @Published var time: UInt64 = 0
    @Published var N = 0
    let defaults = UserDefaults.standard
    
    func test2() {
        let t0 = DispatchTime.now().uptimeNanoseconds
        let jsonData = readLocalFile(forName: "generated")
        let pairs = parse(jsonData: jsonData!)
        N = pairs.count
        for pair in pairs {
            defaults.set(pair.value, forKey: pair.key)
        }
        time = (DispatchTime.now().uptimeNanoseconds - t0) / 1_000_000
    }
    
    private func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }
    
    private func parse(jsonData: Data) -> [Pair] {
        do {
            let decodedData = try JSONDecoder().decode([Pair].self, from: jsonData)
            return decodedData
        } catch {
            print("decode error")
        }
        return []
    }
}

class PrimesCalculator : ObservableObject {
    @Published var N = 10000
    @Published var primes = [Int](repeating: 0, count: 10000)
    @Published var primesString = ""
    @Published var time: UInt64 = 0
    @Published var loading = false;
    var j = 0;
    
    init() {}
    
    func calculatePrimes() {
        loading = true
        primes = []
        primesString = ""
        j = 0
        let t0 = DispatchTime.now().uptimeNanoseconds
        for _ in 1..<N {
            var foundPrime = false;
            while (!foundPrime) {
                j += 1
                if(isPrime(n: j)){
                    self.primes.append(j)
                    // self.primesString.append(String(j) + ",")
                    foundPrime = true
                }
            }
        }
        time = (DispatchTime.now().uptimeNanoseconds - t0) / 1_000_000
        loading = false
    }
    
    private func isPrime(n: Int) -> Bool {
        if (n <= 1) { return false }
        if (n==2) {return true}
        for i in 2...n-1 {
            if (n % i == 0) {
                return false;
            }
        }
        return true;
    }
}

class FetchToDo: ObservableObject {
    // 1.
    @Published var todos = [Todo]()
     
    init() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos")!
        // 2.
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                if let todoData = data {
                    // 3.
                    let decodedData = try JSONDecoder().decode([Todo].self, from: todoData)
                    DispatchQueue.main.async {
                        self.todos = decodedData
                    }
                } else {
                    print("No data")
                }
            } catch {
                print("Error")
            }
        }.resume()
    }
}
