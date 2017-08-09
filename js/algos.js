
// // Find the Longest Phrase
// INPUT: an array contains some strings
// STEP:
// creates an empty string to store the longest Phrase
// FOR each phrase in an array
//   IF length of phrase is longer than current longest phrase
//     sets the phrase to the longest phrase
// OUTPUT: longest phrase

function longestPhrase(array) {
  var longestPhrase = "";
  for(var i = 0; i < array.length; i++) {
    if(array[i] > longestPhrase) {
      longestPhrase = array[i];
    }
  }
  return longestPhrase;
}

// Find a Key-Value Match
// INPUT: two objects contains key value pair
// STEP:
// extracts keys from object and store it in a variable
// FOR each key in the object1
//   FOR each key in the object2
//     IF key-value pair matches, RETURN TRUE
// otherwise RETURN FALSE
// OUTPUT: boolean


function keyValueMatch(object1, object2) {
  var keys1 = Object.keys(object1);
  var keys2 = Object.keys(object2);
  for (var i = 0; i < keys1.length; i++) {
    for (var j = 0; j < keys2.length; j++) {
      if (keys1[i] == keys2[j] && object1[keys1[i]] == object2[keys2[j]]) {
        return true
      }
    }
  }
  return false
}

console.log(longestPhrase(["long phrase","longest phrase",
                           "longer phrase"]));
                           
console.log(keyValueMatch({name: "Steven", age: 54},
                          {name: "Tamir", age: 54}))
console.log(keyValueMatch({animal: "Dog", legs: 4},
                          {animal: "Dog", legs: 3}))
