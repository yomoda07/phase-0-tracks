
// // Find the Longest Phrase
// INPUT: an array of strings
// STEP:
// creates an empty string to store the longest Phrase
// FOR each phrase in an array
//   IF length of phrase is longer than current longest phrase
//     sets the phrase to the longest phrase
//   END
// END
// OUTPUT: longest phrase

function longestPhrase(array) {
  var longestPhrase = "";
  for(var i = 0; i < array.length; i++) {
    if(array[i].length > longestPhrase.length) {
      longestPhrase = array[i];
    }
  }
  return longestPhrase;
}

// // Find a Key-Value Match
// INPUT: two objects
// STEP:
// extracts keys from object and store it in a variable
// FOR each key in the object1
//   FOR each key in the object2
//     IF key-value pair matches, RETURN TRUE
//   END
// END
// otherwise RETURN FALSE
// OUTPUT: BOOLEAN


function keyValueMatch(object1, object2) {
  var keys1 = Object.keys(object1);
  var keys2 = Object.keys(object2);
  for (var i = 0; i < keys1.length; i++) {
    for (var j = 0; j < keys2.length; j++) {
      if (keys1[i] == keys2[j] && object1[keys1[i]] == object2[keys2[j]]) {
        return true;
      }
    }
  }
  return false;
}

// // Generate Random Test Data
// INPUT: integer for length
// STEP:
// create a new array to store the randome data
// create a string of all alfabets
// FOR up to the number of length
//   create a empty string
//   create a random number with a minimum of 1 letter and a maximum of 10 letters.
//   FOR up to the random number
//     add random string extracted from alfabets to empty string
//   END
//   add the string to the array
// END
// OUTPUT array of random words

function randomWordGenerator(num) {
  var random_words = [];
  var alfabets = "abcdefghijklmnopqrstuvwxyz";
  for (var i = 0; i < num; i++) {
    var word = "";
    var word_length = Math.floor(Math.random() * 10 + 1);
    for (var j = 0; j < word_length; j++) {
      word += alfabets[Math.floor(Math.random() * 26)];
    }
    random_words[i] = word;
  }
  return random_words;
}




console.log(longestPhrase(["long phrase","longest phrase",
                           "longer phrase"]));

console.log(keyValueMatch({name: "Steven", age: 54},
                          {name: "Tamir", age: 54}));
console.log(keyValueMatch({animal: "Dog", legs: 4},
                          {animal: "Dog", legs: 3}));

for (var i = 0; i < 10; i++) {
  random_words = randomWordGenerator(4);
  console.log(random_words);
  console.log(longestPhrase(random_words));
}
