class DogHub {
  List<Dog> dog;

  DogHub({this.dog});

  DogHub.fromJson(Map<String, dynamic> json) {
    if (json['dog'] != null) {
      dog = new List<Dog>();
      json['dog'].forEach((v) {
        dog.add(new Dog.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dog != null) {
      data['dog'] = this.dog.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Dog {
  String id;
  String breed;
  String height;
  String weight;
  String size;
  String lifeSpan;
  List<String> furType;
  List<String> personality;
  String image;
  List<String> color;
  bool favorite;

  Dog(
      {this.id,
        this.breed,
        this.height,
        this.weight,
        this.size,
        this.lifeSpan,
        this.furType,
        this.personality,
        this.image,
        this.color,
        this.favorite,
      });

  Dog.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    breed = json['breed'];
    height = json['height'];
    weight = json['weight'];
    size = json['size'];
    lifeSpan = json['life_span'];
    furType = json['fur_type'].cast<String>();
    personality = json['personality'].cast<String>();
    image = json['image'];
    color = json['color'].cast<String>();
    favorite = json['favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['breed'] = this.breed;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['size'] = this.size;
    data['life_span'] = this.lifeSpan;
    data['fur_type'] = this.furType;
    data['personality'] = this.personality;
    data['image'] = this.image;
    data['color'] = this.color;
    data['favotire'] = this.favorite;
    return data;
  }
}