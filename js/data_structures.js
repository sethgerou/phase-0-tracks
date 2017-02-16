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

// constructor function to build a car
function Car(color, year, topSpeed){
    this.color = color;
    this.year = year;
    this.topSpeed = topSpeed;
    this.drive = function(){console.log("vroom at " + topSpeed + " mph !")}
};

car = new Car("red",2017,150);
car.drive();

car2 = new Car("black",2015,180);
car2.drive();

car3 = new Car("blue",2017,140);
car3.drive();

console.log(car3);
