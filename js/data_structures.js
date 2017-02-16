var colors = ["blue", "red", "green", "yellow"];
var names = ["Bill", "Ed", "Theodore", "Earnest"];

colors.push("orange");
names.push("Trusty");

console.log(colors);
console.log(names);

// function to assign name and color to a new object
function assignColors(ary1, ary2) {
  horses = {}
    if (ary1.length == ary2.length) {
      for (var n = 0; n < ary1.length; n++) {
        horses[ary1[n]] = ary2[n];
      }
  }
  return horses;
};

console.log(assignColors(names, colors));
