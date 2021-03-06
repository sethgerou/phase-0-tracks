/*
FUNCTION THAT TAKES AN ARRAY OF WORDS OR PHRASES AND RETURNS THE LONGEST ONE.

INPUT: an array of strings
STEPS: -initialize a variable to store the index of the longest string - initial value 0
       -compare each string to the string at the index in the variable
            -if this string is longer, set the variable to the index of this string
       -repeat for each string.
OUTPUT: a string (the longest in the input array)
*/

function findLongestString(stringArray) {
  var largestIndex = 0; // stores the index of the largest string found so far
  for (var i = 0; i < (stringArray.length); i++) { // loop through each item in the array
      if (stringArray[i].length > stringArray[largestIndex].length) { // if current string is longer
                                                            // than the stored longest string
        largestIndex = i; // store the index of the current string in largestIndex
        }
      }
  return stringArray[largestIndex] // return the largest string
}

/*
FUNCTION THAT TAKES TWO OBJECTS AND CHECKS TO SEE IF THE OBJECTS SHARE
AT LEASE ONE KEY-VALUE PAIR.
INPUT: two objects (key-value pairs)
STEPS: for each key in object 1, check whether that key exits in object 2
          if it does, compare the values
            if they're the same, return TRUE
OUTPUT: TRUE if the value of a key matches the value of a key in the other objects
        otherwise FALSE
*/
function compareObjects(object1, object2) {
  var match = false;
  for (var key in object1) {
      if (key in object2) {
        if (object1[key] == object2[key]) {
          match = true
        }
      }
  }

return match
}

/*
FUNCTION THAT TAKE AN INTEGER FOR LENGTH, RETURN AN ARRAY WITH INTEGER MEMBERS
-EACH A RANDOM WORD OF RANDOM LENGTH FROM 1 TO 10 CHARACTERS.
INPUT: an integer
STEPS: intialize an empty array
       for integer times, generate a word of random length, comprised of random letters.
          store it in the array.
OUTPUT: returns an array of random words or random length
*/
function generateWords(quantity) {
  var words = []  // array to store generated words

  for (i=0; i < (quantity); i++) { // do this code quanitity times
    var alphabet = "abcdefghijklmnopqrstuvwxyz";
    var word = []; // stores the letters to make a word
    length = Math.ceil((Math.random()*10)+1); // determines the length of the word
      for (var n =1; n < length; n++) { // do this code (word) length times
        var index = Math.round(Math.random()*26); // get a random number between 0 and 26
        word.push(alphabet.charAt(index)); // add the character at index to the word array
      }
    words.push(word.join("")); // join the word and add it to the words array.
    }
  return words; // return the array
}

// findLongestString driver code
var farmAry = ["cow", "buffalo", "dog", "billy goat",
             "chicken", "mr. awesome donkey",
             "duck", "alpaca", "rabiit", "turkey"];
var numArray = ["23", "5", "200", "17", "200000", "58", "99"];
var cats = ["Gilbert", "Tiger", "Mr. Fluffinstock", "Tim", "Gertrude"];

console.log("\n\nFinding the longest string in 3 test arrays:")
console.log(findLongestString(farmAry));
console.log(findLongestString(numArray));
console.log(findLongestString(cats));

// compareObjects driver code
var applePhone = {name: "iphone 7",
                  screenSize: 4.7,
                  batteryCapacity: "3000mh",
                  releaseDate: "September2016"
};

var samsungPhone = {name: "galaxy s8",
                    releaseDate: "April2017",
                    screenSize: 5.0,
                    batteryCapacity: "3000mh"
};

var sonyPhone = {name: "Xperia x5r",
                 releaseDate: "October2015",
                 screenSize: 4.5,
                 batteryCapacity: "3400mh"
};

console.log("\n\nComparing applePhone to samsungPhone, then applePhone to sonyPhone:")
console.log(compareObjects(applePhone, samsungPhone));
console.log(compareObjects(applePhone, sonyPhone));

// generateWords driver code
console.log("\n\nGenerating 10 five word arrays, and finding the longest word in each:\n")
for (s = 0; s < 10; s++) {
  console.log("Array " + (s+1) + ": " + (strings = generateWords(5)));
  console.log(longest = findLongestString(strings) + "\n");
}
