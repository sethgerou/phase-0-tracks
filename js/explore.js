// input: string
// steps:for each letter in the string, take the last letter and make it the first letter of a new string.  Do this unil the first character of the string is reached.
// output: reversed string - like 'gnirts'

function reverse(string) {
  var new_str = "";
    for (var i = string.length; i > 0; i-=1) {
      new_str = new_str + string[i-1];
    }
  return new_str;
}

// driver code
var backwards = reverse("octopus");

if ("apple" != "orange") {
  console.log(backwards);
}
