import Foundation

public typealias Supply = (weight: Int, value: Int)

public final class Knapsack {
    let maxWeight: Int
    let drinks: [Supply]
    let foods: [Supply]
    var maxKilometers: Int {
        findMaxKilometres()
    }
    
    init(_ maxWeight: Int, _ foods: [Supply], _ drinks: [Supply]) {
        self.maxWeight = maxWeight
        self.drinks = drinks
        self.foods = foods
    }
    
    func countingArrays(_ array: [Supply]) -> [[Int]] {
        
        var helpVar = Array(repeating: Array(repeating: 0, count: maxWeight+1), count: array.count+1)
        
        for i in 0...array.count {
            
            for j in 0...maxWeight {
                
                if i != 0 && j != 0 {
                    
                    if array[i-1].weight > j {
                        helpVar[i][j] = helpVar[i - 1][j]
                        
                    } else {
                        
                        let oneVariable = helpVar[i-1][j]
                        let twoVariable = array[i-1].value + helpVar[i-1][j - array[i - 1].weight]
                        
                        helpVar[i][j] = max(oneVariable, twoVariable)
                    }
                }
            }
        }
        return helpVar
    }
    
    func findMaxKilometres() -> Int {
        guard maxWeight <= 2500 && maxWeight > 0 else { return 0 }
        
        let foodArray = countingArrays(foods)
        let drinkArray = countingArrays(drinks)
        var distatance = 0

        for i in 0...maxWeight {
            
            let minFood = foodArray[foods.count][i]
            let minDrink = drinkArray[drinks.count][maxWeight-i]
            let minVar = min(minFood, minDrink)
            
            distatance = max(distatance, minVar)
        }
        
        return distatance
    }
}
