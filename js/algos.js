/*
FUNCTION THAT TAKES AN ARRAY OF WORDS OR PHRASES AND RETURNS THE LONGEST ONE.

INPUT: an array of strings
STEPS: -initialize a variable to store the index of the longest string - initial value 0
       -compare each string to the string at the index in the variable
            -if this string is longer, set the variable to the index of this string
       -repeat for each string.
OUTPUT: a string (the longest in the input array)
*/

function find_longest_string(strAry) {
  var largestIndex = 0; // stores the index of the largest string found so far
  for (var i = 0; i < (strAry.length); i++) { // loop through each item in the array
      if (strAry[i].length > strAry[largestIndex].length) { // if current string is longer
                                                            // than the stored longest string
        largestIndex = i; // store the index of the current string in largestIndex
        }
      }
  return strAry[largestIndex] // return the largest string
}

// driver code
var strAry = ["cow", "buffalo", "dog", "billy goat",
             "chicken", "mr. awesome donkey",
             "duck", "alpaca", "rabiit", "turkey"];

console.log(find_longest_string(strAry));
