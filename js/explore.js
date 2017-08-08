// - Psuedcoding
// define a function that takes string as a parameter.
// create an new empty string to store reversed word
// extract each element from left to right in the original string
//   set the extracted letter plus the new string to the new string
// return new string
//

function reverse_string(string) {
  var reversed_string = ""
  for(var i = 0; i < string.length; i++) {
    reversed_string = string[i] + reversed_string
  }
  return reversed_string
}

var olleh = reverse_string("hello")
var ybur = reverse_string("ruby")
var tpircsavaj = reverse_string("javascript")

console.log(olleh == "olleh")
console.log(ybur == "ybur")
console.log(tpircsavaj == "tpircsavaj")
