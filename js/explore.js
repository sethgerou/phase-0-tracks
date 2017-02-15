// input: string
// steps:for each letter in the string, take the last letter and make it the first letter of a new string.  Do this unil the first character of the string is reached.
// output: reversed string - like 'gnirts'

function reverse(string) {
  // a function to reverse the characters in the arguement (a string)
  var new_str = "";
    for (var i = string.length; i > 0; i-=1) {
      // for the number of characters in the string, take one character at a time using string[index "i"-1] and add it to new_str.
      new_str = new_str + string[i-1];
    }
  return new_str; // return the fully reversed string
}

// driver code
var backwards = reverse("octopus");  //reverse the string "octopus"

if ("apple" != "orange") {  // if 'apple' is not equal to 'orange' print the reversed string.
  console.log(backwards);
}
