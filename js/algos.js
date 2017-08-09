

function longest_word(array) {
  var longest_word = "";
  for(var i = 0; i < array.length; i++) {
    if(array[i] > longest_word) {
      longest_word = array[i];
    }
  }
  return longest_word;
}

console.log(longest_word(["long phrase","longest phrase","longer phrase"]));
