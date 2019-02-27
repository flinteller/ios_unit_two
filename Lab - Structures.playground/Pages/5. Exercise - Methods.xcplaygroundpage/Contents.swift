/*:
 ## Exercise - Methods
 
 A `Book` struct has been created for you below. Add an instance method on `Book` called `description` that will print out facts about the book. Then create an instance of `Book` and call this method on that instance.
 */
struct Book {
    var title: String
    var author: String
    var pages: Int
    var price: Double


func description() {
    print("The title of the book is \(title) , the author is \(author) , it has \(pages) pages , and it costs $ \(price).")
}
}
let info = Book(title: "Being Awesome", author: "Brian", pages: 999, price: 999.99)
info.description()

/*:
 A `Post` struct has been created for you below, representing a generic social media post. Add a mutating method on `Post` called `like` that will increment `likes` by one. Then create an instance of `Post` and call `like()` on it. Print out the `likes` property before and after calling the method to see whether or not the value was incremented.
 */
struct Post {
    var message: String
    var likes: Int
    var numberOfComments: Int
    
    mutating func like() {
        likes += 1
    }
}
var p = Post(message: "Hey guys", likes: 9999, numberOfComments: 12)
print(p.likes)
p.like()
print(p.likes)

//: [Previous](@previous)  |  page 5 of 10  |  [Next: App Exercise - Workout Functions](@next)
