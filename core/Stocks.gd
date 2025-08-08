extends Node
class_name Stocks

static func add(stock:Dictionary, k:String, v:float):
    stock[k] = max(0.0, (stock.get(k,0.0) + v))
