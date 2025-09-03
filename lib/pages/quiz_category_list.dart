class Category {
    final String name, imagePath;

    Category(this.name, this.imagePath);
}

const String quizBgPath = "assets/images/quizbg/";

final List<List<String>> categoryData = [
    ["Names of Allah", "Allahbg.jpg"],
    ["Qur'an", "quranbg.jpg"],
    ["Seerah", "prophetmuhammadbg.jpg"],
    ["Prophets", "prophetsbg.jpg"],
    ["Companions", "companionsbg.jpg"],
    ["Women in Islam", "womenbg.jpg"],
    ["Fiqh", "fiqhbg.png"],
    ["Aqeeda", "aqeedahbg.jpg"],
    ["Battles", "battlebg.jpg"],
    ["Qiyamah", "qiyamahbg.jpg"],
    ["Jahannum", "jahannumbg.jpg"],
    ["Jannah", "jannahbg.jpg"],
];

final List<Category> categories = categoryData.map((data) => Category(data[0], '$quizBgPath${data[1]}')).toList();

/*

//* In case you wanna use Map *//

final Map<String, String> categoryMap = {
    "Names of Allah": "Allahbg.jpg",
    "Qur'an": "quranbg.jpg",
    "Seerah": "prophetmuhammadbg.jpg",
    "Prophets": "prophetsbg.jpg",
    "Companions": "companionsbg.jpg",
    "Women in Islam": "womenbg.jpg",
    "Fiqh": "fiqhbg.png",
    "Aqeeda": "aqeedahbg.jpg",
    "Battles": "battlebg.jpg",
    "Qiyamah": "qiyamahbg.jpg",
    "Jahannum": "jahannumbg.jpg",
    "Jannah": "jannahbg.jpg",
};

final List<Category> categories = categoryMap.entries.map((entry) => Category(entry.key, "assets/images/quizbg/${entry.value}")).toList();

*/