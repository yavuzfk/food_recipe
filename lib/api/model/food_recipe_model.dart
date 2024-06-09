class FoodRecipe {
  String? name;
  List<String>? materials;
  String? recipe;
  String? listName;
  String? image;
  FoodRecipe(
      {this.name, this.materials, this.recipe, this.listName, this.image});

  FoodRecipe.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    materials = json['materials'].cast<String>();
    recipe = json['recipe'];
    listName = json['listName'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['materials'] = materials;
    data['recipe'] = recipe;
    data['listName'] = listName;
    data['image'] = image;
    return data;
  }
}
