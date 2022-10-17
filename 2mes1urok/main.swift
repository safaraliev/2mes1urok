
import Foundation



// 1

class Car{

    var name: String
    var model: String
    var obyem: Double
    var moshnost: Int
    var rashodNa100: Int
    var from0to100: Double

    func obyemPlus() {
        obyem += 1
        moshnost += 100
        rashodNa100 += 2
        from0to100 -= 1
    }
    func oblegchitKuzov() {
        moshnost += 20
        rashodNa100 -= 1
        from0to100 -= 0.5
    }
    func chipirovanie() {
        from0to100 -= 0.5
        moshnost += 20
    }

    init (name: String, model:String, obyem: Double, moshnost: Int, rashodNa100:Int, from0to100:Double){
        self.name = name
        self.obyem = obyem
        self.model = model
        self.moshnost = moshnost
        self.from0to100 = from0to100
        self.rashodNa100 = rashodNa100

    }
}

var skylyne = Car(name: "Nissan", model: "Skyline", obyem: 2.0, moshnost: 155, rashodNa100: 9, from0to100: 10.5)

skylyne.oblegchitKuzov()
skylyne.chipirovanie()
skylyne.obyemPlus()

dump(skylyne)


// 2

class Shop{

    var name = "Мармеладка"
    var ploshad = 120
    var personal = 10
    var products = ["Coca-Cola": 50, "Pepsi": 50, "Хлеб": 25, "Яйца": 100, "Ролтон": 25, "Мука": 100, "Чай": 100]
    func showProducts(){
        print(products)
    }

    func addToShop(name: String, price: Int) {
        products["\(name)"] = price
    }
}

class Product{

    var name: String
    var price: Int

    init(name: String, price: Int){
        self.name = name
        self.price = price
    }
}


var shop = Shop()
shop.showProducts()

var sugar = Product(name: "Сахар", price: 70)

shop.addToShop(name: sugar.name, price: sugar.price)
shop.showProducts()


// 3

class Client {
    
    var name: String
    var surname: String
    var id: Int
    var balance: Int
    
    init(name: String, surname: String, id: Int, balance: Int) {
        self.name = name
        self.surname = surname
        self.id = id
        self.balance = balance
    }
}


class Bank {
    
    var name = "KKB"
    var clients: [Client]
    
    init (clients: [Client]){
    self.clients = clients
    }
    
    // Просмотр баланса по ID
    func balanceID(id: Int) {
        for i in clients{
            if i.id == id   {
                print("Баланс равен \(i.balance)")
            }
        }
    }
    
    // Просмотр баланса по фамилии
    func balanceSurname (surname: String){
        for i in clients{
            if i.surname == surname{
                print("Баланс равен \(i.balance)")
            }
        }
    }
    
    // Перевод денег по имени
    func perevod(fromName: String, toName: String, summa: Int) {
        for i in clients{
            if i.name == fromName{
                i.balance -= summa
            }
            if i.name == toName{
                i.balance += summa
            }
        }
    }
    
}

var client1 = Client(name: "Nuridin", surname: "Safaraliev", id: 111, balance: 1500)
    
var client2 = Client(name: "Sadyr", surname: "Japarov", id: 0, balance: 1000000)

var client3 = Client(name: "Petr", surname: "Petrovich", id: 15, balance: 30000)

var bank = Bank(clients: [client1, client2, client3])




bank.balanceID(id: 111)

bank.balanceSurname(surname: "Japarov")

bank.perevod(fromName: "Japarov", toName: "Nuridin", summa: 1000000)

bank.balanceID(id: 111)
