
var str = "Hello, playground"
print(str)

struct Point {
    var x: Int
    var y: Int
    
    mutating func moveByX(x: Int, andY y:Int) {
        let innerX = x
        self.x += innerX
    }
    
}

func move(point: Point, byX: Int, andY: Int) -> Point {
    var newPoint = point
    newPoint.x += byX
    newPoint.y += andY
    return newPoint
}
var p = Point(x: 1, y: 1)

move(point: p, byX: 4, andY: 2)


