import Foundation

class StockMaximize {

    func countProfit(prices: [Int]) -> Int {
        var arr = prices
        var index = 0
        var result = 0
        
        if arr.isEmpty || arr.count == 1 || (arr.count == 2 && arr[0] == arr.max()) {
            return 0
        }
        
        if arr.count > 2 && arr[0] == arr.max() {
            arr.remove(at: 0)
        
        }
        
        if arr[arr.count-2] == arr.max() {
            arr.removeLast()
            arr.removeLast()
        }
        
        for i in arr {
            
            guard let max = arr.max() else { return 0 }
            
            if arr[arr.count - 1] == max {
                result += max - i
            } else {
                result += max - i
                arr.remove(at: index)
                index -= 1
            }
            index += 1
        }
        
        return result
    }
}
