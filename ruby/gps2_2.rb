# Pseudocode:

# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps:
# create a emtpy hash
# split the string so each item is its own string
# set default quantity (default = 1)
# create an array containing each item as its own string
# put each item into the hash one at a time, allowing each item to have a default quantity
# print the list to the console [can you use one of your other methods here?]
# output: hash data structure with each item as it's own key values

# Method to add an item to a list
# input: list, item name, and optional quantity
# steps:
# put item as a key and a quantity as a value to the hash
# output: new hash with new item/value in it

# Method to remove an item from the list
# input: list, item name
# steps:
# indicate which item you want to remove, regardless of placement in hash
# output: new hash without the indicated item

# Method to update the quantity of an item
# input: list, item name, and the new quantity
# steps:
# pull up the key (item name) and have it equal the new value (new quantity)
# output: new hash with one of its items having a new value

# Method to print a list and make it look pretty
# input: list
# steps:
# extract each item out of the list with its associated value
# make it so that each item/quantity pair is presented in their own line
# output: list of each item and quantity pair printed line-by-line

# Grocery List

# it takes each item in string and put the item in the hash
def create_items(string)
  item_list = {}
  string.split(" ").each { |item| item_list[item] = 1 }
  item_list
end

#takes spesifc item and put it in hash with qty
def add_item(item_list, item, qty=1)
  item_list[item] = qty
  item_list
end

#takes spesifc item, takes it out from the hash
def remove_item(item_list, item)
  item_list.delete(item)
  item_list
end

#pulls up spesifc item, give new value to the item
def update_qty(item_list, item, qty)
  item_list[item] = qty
  item_list
end

#takes the hash turns it into the bullted list
def print_item_list(item_list)
  item_list.each { |item, qty| puts "・#{item} : #{qty}" }
end


#Driver code
item_list = create_items("Carrots Apples Peas Pizza")
add_item(item_list, "Lemonade", 2)
add_item(item_list, "Tomatoes", 3)
add_item(item_list, "Onions", 1)
add_item(item_list, "Ice Cream", 4)
remove_item(item_list, "Lemonade")
update_qty(item_list, "Ice Cream", 1)
print_item_list(item_list)


=begin
#Reflection
- What did you learn about pseudocode from working on this challenge?
  ・Thorough this challenge, I learned it's important to specify what data I pass and what date I expect for return value.
- What are the tradeoffs of using arrays and hashes for this challenge?
  ・If we use array, we can use index number, but it will not be readable, because item and quantity look not pair.
    If we use hash, it will be readable, but need additional code to use index number.
- What does a method return?
  ・method can return String, Boolean, Integer, array and hash
- What kind of things can you pass into methods as arguments?
  ・String, Boolean, Integer, array, hash and variable.
- How can you pass information between methods?
  ・set retrun value of a method to a variable, and pass the variable to another method as parameter.
- What concepts were solidified in this challenge, and what concepts are still confusing?
  ・How to write pseudocode is solidified, but I think it will take a time to actually write meaningful pseudocode.
=end
