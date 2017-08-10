var colors = ["red", "blue", "yellow", "frog green"];
var horse_names = ["Cheeky", "Flicker", "Digger", "Stormy Weather"];

colors.push("orange");
horse_names.push("wolverine");

//console.log(colors);
//console.log(horse_names);

var horse_and_color = {};
	for (var i = 0; i < colors.length; i++) {
		horse_and_color[horse_names[i]] = colors[i];
	}
console.log(horse_and_color);

var car = {name: 'honda', year: 2000, color: 'red'};

function Car(name, year, color) {

	console.log("New car:", this)
	this.name = name;
	this.year = year;
	this.color = color;

	this.speed = function() { console.log("SUPER FAST!"); };
}

console.log("Let's create a new car...");

var anotherCar = new Car("Toyota", 1995, "silver");
console.log(anotherCar.name);
console.log("The car is...");
anotherCar.speed();


var anotherCar = new Car("Tesla", 2017, "red");
console.log(anotherCar.name);
console.log("The car is...");
anotherCar.speed();

var anotherCar = new Car("Mazda", 2010, "black");
console.log(anotherCar.name);
console.log("The car is...");
anotherCar.speed();

var anotherCar = new Car("Audi", 2017, "blue");
console.log(anotherCar.name);
console.log("The car is...");
anotherCar.speed();
