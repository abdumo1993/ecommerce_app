enum Category{
    Automotive,
    Beauty,
    BeautyCosemtics,
    BeautySoap,
    Books,
    BooksFiction,
    BooksNonFiction,
    Electronics,
    ElectronicsPhone,
    ElectronicsPc,
    FashionMen,
    FashionWomen,
    FashionBoys,
    FashionGirls,
    FashionShoes,
    FashionBoysShoes,
    FashionGirlsShoes,
    Home,
    HomeKitchen,
    HomeToilet,
    Movies ,
    Other,
    Software,
    SoftwareGames,
    Toys,
}


class CategoryToList {
List toCategoryList(){
  var names = [];
  Category.values.forEach((element) {
    names.add(insertSpaces(element.name));
  });
  return names;
}

String insertSpaces(String input) {
 // Regular expression to find an uppercase letter followed by a lowercase letter
 RegExp regExp = RegExp(r'([a-z])([A-Z])');

 // Replace all matches with a space followed by the matched lowercase letter
 String output = input.replaceAllMapped(regExp, (match) {
    // The first group is the uppercase letter, and the second group is the lowercase letter
    return '${match.group(1)}\n${match.group(2)}';
 });

 return output;
}
}