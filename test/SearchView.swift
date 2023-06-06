

import SwiftUI


struct FoodItem: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let price: Double
    let description: String
}




let allItems: [FoodItem] = [
    FoodItem(name: "Doner Kebap", image: "doner_kebap", price: 12.99,  description: "Doner Kebap is a popular Turkish street food that has gained worldwide fame. It is made by marinating slices of seasoned meat, usually lamb or chicken, on a vertical rotisserie. As the meat slowly cooks, it is thinly sliced and served in a warm pita bread or wrapped in a flatbread along with various accompaniments. These may include fresh vegetables like lettuce, tomatoes, onions, and cucumbers, as well as traditional sauces such as yogurt-based tzatziki or spicy chili sauce. Döner Kebap is known for its juicy and flavorful meat, combined with the contrasting textures and vibrant flavors of the accompanying ingredients, creating a satisfying and delicious meal."),
    FoodItem(name: "Adana Kebap", image: "adana_kebap", price: 14.99,  description: "Adana Kebap is a traditional Turkish kebab that originates from the city of Adana. It is made with ground lamb or a combination of lamb and beef, mixed with various spices and herbs. The meat mixture is shaped onto skewers and grilled over an open flame, resulting in a flavorful and juicy kebab. Adana Kebap is known for its rich and robust taste, enhanced by the use of spices like red pepper flakes, cumin, and paprika. It is typically served with grilled vegetables, rice, and flatbread. With its bold flavors and satisfying texture, Adana Kebap is a popular choice for meat lovers seeking an authentic and delicious kebab experience."),
    FoodItem(name: "Urfa Kebap", image: "urfa_kebap", price: 14.99,  description: "Urfa Kebap, named after the city of Urfa in Turkey, is a popular and flavorful kebab variety. It is made from ground lamb or a mixture of lamb and beef, seasoned with a unique blend of spices and herbs. The meat mixture is shaped onto skewers and grilled over charcoal or an open flame, resulting in a succulent and aromatic kebab. Urfa Kebap is known for its rich and smoky flavor, imparted by the use of spices like Urfa pepper, which adds a distinct mild heat and a hint of sweetness. It is typically served with traditional accompaniments such as lavash bread, grilled vegetables, and a side of yogurt. Urfa Kebap offers a delightful combination of robust flavors and tender meat, making it a beloved choice among kebab enthusiasts."),
    FoodItem(name: "Iskender Kebap", image: "iskender_kebap", price: 15.99,  description: "Iskender Kebap is a delicious and iconic Turkish dish that originated in the city of Bursa. It is made with tender slices of grilled lamb or beef, traditionally cooked on a vertical rotisserie. The meat is then placed on a bed of freshly baked pita bread, generously topped with a rich tomato-based sauce, and served with a side of creamy yogurt. Additional melted butter and grilled tomatoes are often added to enhance the flavors. İskender Kebap is known for its harmonious combination of tender meat, tangy tomato sauce, and creamy yogurt, creating a mouthwatering experience. It is typically garnished with parsley and enjoyed as a hearty and satisfying meal."),
    FoodItem(name: "Sish Kebap", image: "iskender_kebap", price: 13.99,  description: "Shish Kebab, is a popular grilled meat dish that can be found in various Middle Eastern and Mediterranean cuisines. It typically consists of marinated cubes of meat, such as lamb, beef, or chicken, skewered and cooked over an open flame or grill. The meat is seasoned with a blend of spices and herbs, enhancing its flavor and tenderness. Şiş Kebap is loved for its smoky aroma and charred exterior, while the inside remains juicy and succulent. It is often served with rice, grilled vegetables, and accompanied by sauces like tzatziki or tahini. Şiş Kebap offers a delightful combination of grilled flavors and tender meat, making it a beloved choice for meat enthusiasts."),
    
    FoodItem(name: "Tiramisu", image: "tiramisu", price: 4.99,  description: "Tiramisu is a classic Italian dessert consisting of layers of espresso-soaked ladyfinger biscuits and a creamy mixture of mascarpone cheese, eggs, and sugar. It is dusted with cocoa powder on top for added flavor. Tiramisu is a delightful dessert enjoyed worldwide, with its balanced combination of sweetness and bitterness. Gramage: Varies depending on serving size."),
    FoodItem(name: "Cheesecake", image: "cheesecake", price: 5.99,  description: "Cheesecake is a creamy and indulgent dessert. It features a buttery graham cracker crust filled with a smooth, velvety cream cheese mixture. The cheesecake is baked until perfectly set and then chilled before serving. With its rich flavor and various topping options like fresh fruits or chocolate, cheesecake is a beloved dessert enjoyed by many for its irresistible creaminess and delightful sweetness."),
    FoodItem(name: "Brownie", image: "brownie", price: 3.99,  description: "Brownie is a delectable dessert loved by chocolate enthusiasts. It is a dense and fudgy square-shaped treat made with rich chocolate, butter, sugar, eggs, and flour. Brownies have a slightly crisp exterior and a gooey, moist interior. They can be enjoyed plain or enhanced with additions like nuts, chocolate chips, or swirls of caramel. Brownies are often served warm and paired with a scoop of vanilla ice cream for an extra indulgence. With their intense chocolate flavor and irresistible texture, brownies are a delightful treat for any chocolate lover."),
    
    FoodItem(name: "Classic Burger", image: "classic_burger", price: 10.99,  description: "The Classic Burger is a perfect choice to savor the true essence of flavor. This classic recipe is prepared with a 200-gram (100% beef) patty made from carefully selected fresh ingredients. It includes high-quality beef, fresh lettuce, tomato slices, and onion rings. To enhance the taste, it is flavored with special sauces, and you have the option to add cheese based on your preference. The Classic Burger offers a delightful experience with each bite, making it an ideal choice for a quick and satisfying meal. Place your order now and indulge in the deliciousness of this burger!"),
    FoodItem(name: "Cheese Burger", image: "cheese_burger", price: 12.99,  description: "The Cheese Burger offers a classic combination of flavors. It features a 200-gram (100% beef) patty cooked to perfection. Topped with your choice of cheese, such as cheddar, mozzarella, or pepper jack, this burger offers a delightful cheese experience. It is accompanied by fresh lettuce, tomato slices, and onion rings. The burger is served on a freshly toasted sesame seed bun, and it is enhanced with special sauces to elevate the taste."),
    FoodItem(name: "Vegan Burger", image: "vegan_burger", price: 11.99,  description: "The Vegan Burger offers a healthy and flavorful plant-based alternative. It is prepared with a plant-based patty made from 100% plant-based ingredients. It is served with fresh lettuce, tomato slices, and onion rings. The burger is seasoned with a variety of vegan-friendly sauces, and it is served on a freshly toasted sesame seed bun."),
    FoodItem(name: "BBQ Burger", image: "bbq_burger", price: 13.99,  description: "The BBQ Burger offers a delightful flavor experience. It features a 200-gram (100% beef) patty generously coated with a special BBQ sauce. It is accompanied by fresh lettuce, tomato slices, and onion rings. Additionally, you have the option to add extra toppings like cheddar cheese or crispy bacon to customize your burger. This delicious creation is served on a freshly toasted sesame seed bun."),
    FoodItem(name: "Bacon Burger", image: "bacon_burger", price: 14.99,  description: "Bacon Burger, a delicious option enhanced with smoked sliced bacon. This burger is prepared with a 200-gram (100% beef) patty and topped with sliced bacon. It includes fresh lettuce, tomato slices, and onion rings. Additionally, you can add extra ingredients such as cheddar cheese or special sauces to your burger. This satisfying burger is served on a freshly toasted sesame seed bun."),
    
    FoodItem(name: "Limonade", image: "limonata", price: 3.99,  description: "Limonade, refreshing and citrusy, is a classic thirst-quenching beverage. It is made by combining freshly squeezed lemon juice, water, and sugar (or a sweetener of choice). The result is a tangy and slightly sweet drink that is perfect for hot summer days or any time you desire a burst of citrus flavor. Limonade can be enjoyed over ice, garnished with a lemon slice or mint leaves for a touch of freshness. It's a popular choice to cool down and revitalize with its invigorating taste."),
    FoodItem(name: "Iced Coffee", image: "iced_coffee", price: 4.99,  description: "Iced Coffee is a refreshing and energizing beverage enjoyed by coffee lovers. It is made by brewing coffee using various methods like espresso or cold brew, and then chilling it over ice. Sweeteners, milk, or flavorings can be added according to personal preference. The result is a cool and flavorful coffee drink that provides a delightful combination of caffeine and refreshment. Iced Coffee is a popular choice to beat the heat and enjoy a cooling pick-me-up on warm days or anytime you crave a chilled coffee experience."),
    FoodItem(name: "Green Tea", image: "green_tea", price: 2.99,  description: "Green Tea is a popular and healthful beverage enjoyed for its unique flavor and potential health benefits. It is made from the leaves of the Camellia sinensis plant, which are minimally processed, allowing the tea to retain its natural green color and delicate taste. Green Tea is known for its refreshing and slightly vegetal flavor profile, often described as grassy or earthy. It is rich in antioxidants and may offer various potential health benefits. Green Tea can be enjoyed hot or iced, making it a versatile and enjoyable beverage for tea enthusiasts seeking a gentle yet invigorating taste."),
    FoodItem(name: "Smoothie", image: "smoothie", price: 5.99,  description: "Smoothie is a delicious and refreshing blended beverage made with a combination of fruits, vegetables, yogurt, and other ingredients. It is a versatile drink that allows for endless creativity and customization. Smoothies can be made with a variety of fresh or frozen fruits such as berries, bananas, mangoes, or peaches. They can also incorporate leafy greens like spinach or kale for added nutrition. Additional ingredients like yogurt, milk, or plant-based milk alternatives are often added to create a creamy and smooth texture. Smoothies are a popular choice for a quick and nutritious snack or meal replacement, offering a tasty way to enjoy a variety of fruits and vegetables in one convenient drink."),
    
    FoodItem(name: "Spaghetti Carbonara", image: "spaghetti_carbonara", price: 12.99,  description: "Spaghetti Carbonara is a classic Italian pasta dish known for its rich and creamy sauce. It is made with spaghetti noodles tossed in a sauce made from eggs, Parmesan cheese, crispy pancetta or bacon, and black pepper. The heat from the cooked pasta and pancetta or bacon helps to gently cook the eggs, creating a luscious and velvety texture. Spaghetti Carbonara is typically garnished with additional grated Parmesan cheese and chopped parsley for added flavor and freshness. This dish is loved for its simplicity and indulgent taste, making it a favorite among pasta lovers."),
    FoodItem(name: "Fettuccine Alfredo", image: "fettuccine_alfredo", price: 11.99,  description: "Fettuccine Alfredo is a creamy and indulgent pasta dish that hails from Italy. It features long, flat fettuccine noodles tossed in a velvety sauce made with butter, heavy cream, and Parmesan cheese. The sauce is typically prepared by melting butter in a pan, adding cream, and allowing it to simmer until it thickens. Grated Parmesan cheese is then stirred into the sauce, creating a smooth and cheesy coating for the pasta. Fettuccine Alfredo is often garnished with a sprinkle of black pepper and chopped parsley for added flavor and presentation. This dish is beloved for its luxurious and comforting taste, making it a favorite choice for pasta enthusiasts."),
    FoodItem(name: "Lasagna", image: "lasagna", price: 14.99,  description: "Lasagna is a beloved Italian dish that consists of layers of pasta sheets, meat or vegetable filling, and cheese, baked to perfection. The pasta sheets are typically layered with a rich tomato-based meat sauce, creamy béchamel sauce, and a generous amount of cheese, such as mozzarella and Parmesan. Additional ingredients like ground beef, sausage, vegetables, and herbs may be included in the filling to enhance the flavors. The layered components create a harmonious combination of textures and flavors as the lasagna bakes in the oven. This comforting and hearty dish is a favorite among pasta enthusiasts, showcasing the deliciousness of Italian cuisine."),
    FoodItem(name: "Penne Arrabbiata", image: "penne_arrabbiata", price: 10.99,  description: "Penne Arrabbiata is a spicy and flavorful Italian pasta dish. It consists of penne pasta cooked al dente and tossed in a fiery tomato sauce. The sauce is typically made with tomatoes, garlic, red chili peppers, olive oil, and sometimes a splash of white wine. The heat from the chili peppers gives the dish its characteristic spiciness, while the garlic and tomatoes add depth of flavor. Penne Arrabbiata is often garnished with fresh parsley and grated Parmesan cheese. It offers a delightful combination of tangy, spicy, and savory flavors, making it a favorite choice for those who enjoy a bit of heat in their pasta."),
    FoodItem(name: "Pesto Pasta", image: "pesto_pasta", price: 12.99,      description: "Pesto Pasta is a vibrant and flavorful Italian dish that features pasta tossed in a delicious basil sauce known as pesto. The pesto sauce is made from fresh basil leaves, garlic, pine nuts, Parmesan cheese, olive oil, and a hint of lemon juice. These ingredients are blended together to create a vibrant green sauce with a rich and herbaceous flavor. The pasta, typically spaghetti or linguine, is cooked al dente and then coated in the pesto sauce. Pesto Pasta is often garnished with additional Parmesan cheese and fresh basil leaves for added aroma and presentation. This dish offers a delightful burst of freshness and is loved by pesto enthusiasts."),
    
    FoodItem(name: "Margarita", image: "margarita_pizza", price: 10.99,  description: "Margherita Pizza is a classic Italian pizza known for its simplicity and delicious flavors. It features a thin crust topped with tomato sauce, fresh mozzarella cheese, and fresh basil leaves. The tomato sauce provides a tangy and savory base, while the mozzarella cheese melts and creates a creamy texture. The pizza is then garnished with aromatic basil leaves, adding a fresh and herbaceous note. Margherita Pizza is loved for its balance of flavors and the use of high-quality ingredients. It is a timeless favorite among pizza lovers and showcases the essence of traditional Italian pizza."),
    FoodItem(name: "Pepperoni", image: "pepperoni_pizza", price: 12.99,  description: "Pepperoni Pizza is a beloved American-style pizza that is known for its bold and savory flavors. It starts with a classic pizza crust topped with tomato sauce and generous amounts of sliced pepperoni. The pepperoni is a type of spicy Italian salami that adds a rich and slightly spicy taste to the pizza. The pizza is then covered with a layer of melted cheese, typically mozzarella, which creates a gooey and stretchy texture. Pepperoni Pizza is often enjoyed for its satisfying combination of tangy tomato sauce, savory pepperoni, and melted cheese. It is a popular choice among pizza enthusiasts and is a staple in many pizzerias."),
    FoodItem(name: "Vegetarian", image: "vegetarian_pizza", price: 11.99,  description: "Vegetarian Pizza is a flavorful and satisfying pizza option that caters to those who follow a vegetarian diet. It features a pizza crust topped with a variety of colorful and nutritious vegetables. Common toppings include bell peppers, onions, mushrooms, tomatoes, olives, and sometimes even fresh spinach or arugula. The pizza is then generously covered with melted cheese, typically mozzarella, which adds a creamy and savory element to the dish. Vegetarian Pizza offers a delicious combination of flavors and textures, showcasing the natural goodness of vegetables. It is a popular choice among vegetarians and a great option for those seeking a meatless pizza."),
    FoodItem(name: "BBQ Chicken", image: "bbq_chicken_pizza", price: 13.99,  description: "BBQ Chicken Pizza is a mouthwatering pizza variety that combines the flavors of barbecue sauce, tender chicken, and melted cheese. It starts with a pizza crust topped with tangy and smoky barbecue sauce, which serves as the base. Diced or shredded cooked chicken is then spread over the sauce, adding a savory and protein-rich element. The pizza is generously covered with melted cheese, often a blend of mozzarella and cheddar, creating a gooey and melty texture. Additional toppings like red onions, cilantro, or even pineapple can be added for extra flavor. BBQ Chicken Pizza offers a delicious balance of sweet, tangy, and savory flavors, making it a popular choice for pizza lovers."),
    FoodItem(name: "Meat Lovers", image: "meat_lovers_pizza", price: 14.99,  description: "Meat Lovers Pizza is a hearty and indulgent pizza variation that is packed with various types of meat toppings. It starts with a pizza crust that is generously topped with a combination of meats such as pepperoni, sausage, ham, and bacon. These meat toppings provide a savory, rich, and satisfying flavor to the pizza. The crust is then covered with a layer of tomato sauce and melted cheese, typically mozzarella, which adds a creamy and gooey texture to the pizza. Meat Lovers Pizza is a favorite among meat enthusiasts who enjoy the bold and robust flavors that the different meats bring to the table. It is a filling and satisfying option for those craving a meaty pizza experience."),
    
    FoodItem(name: "Caesar Salata", image: "caesar_salad", price: 6.99,  description: "Caesar Salad is a classic salad that originated in Mexico but gained popularity worldwide. It features crisp romaine lettuce leaves tossed in a creamy and tangy dressing made with anchovies, garlic, Parmesan cheese, lemon juice, and olive oil. The salad is typically garnished with croutons for added crunch and flavor. Optional additions can include grilled chicken, shrimp, or bacon to make it a heartier meal. Caesar Salad is loved for its refreshing and zesty flavors, making it a popular choice as a side dish or a light main course."),
    FoodItem(name: "Yunan Salatası", image: "greek_salad", price: 7.99,  description: "Greek Salad, also known as Horiatiki, is a refreshing and vibrant salad originating from Greece. It showcases the flavors of the Mediterranean with a combination of fresh vegetables, herbs, and feta cheese. The salad typically includes crisp lettuce, juicy tomatoes, cucumbers, red onions, and Kalamata olives. It is then topped with chunks of tangy feta cheese and sprinkled with dried oregano. The salad is dressed simply with extra virgin olive oil and a splash of lemon juice, enhancing the natural flavors of the ingredients. Greek Salad offers a delightful balance of textures and tastes, making it a popular choice for those seeking a light and healthy salad option."),
    FoodItem(name: "Cobb Salatası", image: "cobb_salad", price: 8.99,  description: "Cobb Salad is a hearty and flavorful salad that originated in the United States. It is named after its creator, Robert Cobb, who first made it at the Hollywood Brown Derby restaurant. The salad is known for its colorful presentation and variety of ingredients. It typically includes chopped lettuce, grilled chicken breast, hard-boiled eggs, crispy bacon, ripe tomatoes, creamy avocado, crumbled blue cheese, and sliced red onions. These ingredients are arranged in rows or sections on top of the lettuce, creating an appealing visual appeal. Cobb Salad is often served with a tangy and creamy dressing such as blue cheese or ranch dressing. It offers a satisfying combination of textures and flavors, making it a popular choice for a satisfying meal."),
    FoodItem(name: "Waldorf Salatası", image: "waldorf_salad", price: 9.99,  description: "Waldorf Salad is a classic salad that originated at the Waldorf Hotel in New York City. It is known for its combination of crisp apples, crunchy celery, sweet grapes, and walnuts, all dressed in a creamy mayonnaise-based dressing. The salad is typically made with fresh lettuce as a base and then topped with the diced apples, sliced celery, halved grapes, and chopped walnuts. The creamy dressing, made with mayonnaise and a hint of lemon juice, binds all the ingredients together and adds a tangy flavor. Waldorf Salad offers a refreshing and satisfying mix of textures and flavors, making it a popular choice for a light and flavorful salad option."),
    FoodItem(name: "Nicoise Salatası", image: "nicoise_salad", price: 10.99,  description: "Nicoise Salad is a French-inspired salad that originated in the city of Nice. It is a vibrant and flavorful salad that combines a variety of ingredients to create a satisfying and well-rounded meal. The salad typically includes boiled or steamed potatoes, blanched green beans, hard-boiled eggs, ripe tomatoes, black olives, and anchovies. It is often garnished with fresh basil or parsley for added freshness and flavor. Nicoise Salad is traditionally dressed with a vinaigrette made with olive oil, Dijon mustard, and vinegar. The combination of the different ingredients creates a harmonious balance of textures and tastes, making Nicoise Salad a popular choice for a light yet fulfilling salad option."),
    
    FoodItem(name: "Club Sandwich", image: "club_sandwich", price: 7.99,  description: "Club Sandwich is a classic sandwich that is loved for its layers of delicious ingredients. It typically consists of three slices of toasted bread with layers of sliced turkey or chicken, crispy bacon, lettuce, tomato, and mayonnaise. Some variations also include sliced cheese, avocado, or boiled eggs. The sandwich is usually cut into quarters and held together with toothpicks. Club Sandwich is known for its combination of savory, salty, and fresh flavors. It is a popular choice for a quick and satisfying meal or a tasty grab-and-go option."),
    FoodItem(name: "Turkey Sandwich", image: "turkey_sandwich", price: 8.99,  description: "Turkey Sandwich is a classic sandwich made with slices of roasted or smoked turkey meat. It is a popular choice for a quick and delicious meal. The sandwich typically features sliced turkey layered between two slices of bread, along with lettuce, tomato, and mayonnaise. Some variations may include additional toppings like cheese, avocado, bacon, or mustard. The combination of tender turkey, fresh vegetables, and creamy mayo creates a satisfying and flavorful sandwich. Turkey Sandwich is often enjoyed as a versatile option for lunch or a light meal."),
    FoodItem(name: "Ham Sandwich", image: "ham_sandwich", price: 8.99,  description: "Ham Sandwich is a classic sandwich made with slices of ham, typically served cold or at room temperature. It is a simple yet delicious sandwich option enjoyed by many. The sandwich consists of thinly sliced ham placed between two slices of bread, often accompanied by lettuce, tomato, and mayonnaise. Some variations may include additional ingredients such as cheese, pickles, or mustard. The combination of savory ham, fresh vegetables, and creamy condiments creates a satisfying flavor profile. Ham Sandwich is a versatile choice for a quick and tasty meal or a convenient option for picnics and lunches."),
    FoodItem(name: "Cheese Sandwich", image: "cheese_sandwich", price: 7.99,  description: "Cheese Sandwich is a classic sandwich that highlights the deliciousness of cheese. It is a simple yet satisfying option enjoyed by cheese lovers of all ages. The sandwich typically consists of one or more types of sliced cheese placed between two slices of bread. Popular cheese choices include cheddar, Swiss, mozzarella, or American cheese. Some variations may also include additional ingredients like tomato, lettuce, or condiments such as mayonnaise or mustard. The combination of the creamy, melty cheese and the soft bread creates a comforting and flavorful sandwich. Cheese Sandwich is a versatile choice for a quick snack or a light meal."),
    FoodItem(name: "Veggie Sandwich", image: "veggie_sandwich", price: 7.99,  description: "Veggie Sandwich is a flavorful and nutritious sandwich option for those who prefer a plant-based or vegetarian diet. It is packed with a variety of fresh vegetables and delicious ingredients. The sandwich typically features a combination of sliced or grilled vegetables such as lettuce, tomatoes, cucumbers, bell peppers, and onions. It may also include ingredients like avocado, sprouts, cheese, and a spread such as hummus or pesto for added flavor. Veggie Sandwich is a versatile choice that allows for customization based on personal preferences. It offers a satisfying and wholesome meal option for those looking for a lighter, meat-free alternative."),
    
    FoodItem(name: "Chicken Soup", image: "chicken_soup", price: 8.99,  description: "Chicken Soup is a comforting and nourishing soup made with chicken, vegetables, and flavorful broth. It is a classic dish enjoyed for its warmth and soothing qualities. The soup typically features tender pieces of chicken, mixed vegetables such as carrots, celery, and onions, and is cooked in a savory broth seasoned with herbs and spices. It is known for its rich aroma and hearty flavor. Chicken Soup is often considered a go-to option for cold or rainy days, as well as for providing comfort during illness. It is a satisfying and wholesome soup that is both delicious and comforting."),
    FoodItem(name: "Lentil Soup", image: "lentil_soup", price: 7.99,  description: "Lentil Soup is a hearty and nutritious soup made with lentils, vegetables, and flavorful seasonings. It is a popular choice among those seeking a delicious and satisfying plant-based meal. The soup features cooked lentils, which are legumes packed with protein and fiber, combined with a medley of vegetables such as carrots, onions, and celery. It is often seasoned with herbs and spices to enhance the flavor. Lentil Soup is known for its rich and comforting texture, and it provides a good source of essential nutrients. It is a nourishing soup option that is both tasty and wholesome."),
    FoodItem(name: "Tomato Soup", image: "tomato_soup", price: 6.99,  description: "Tomato Soup is a classic and comforting soup made primarily with tomatoes. It is known for its smooth and velvety texture and rich tomato flavor. The soup is typically made by simmering ripe tomatoes along with onions, garlic, and various herbs and spices. It can be enjoyed as a standalone soup or paired with grilled cheese sandwiches or croutons for added crunch. Tomato Soup is a popular choice for its simplicity and versatility, making it a comforting option for any time of the year. It is a go-to soup for tomato lovers and a favorite for those seeking a warm and satisfying meal."),
    FoodItem(name: "Vegetable Soup", image: "vegetable_soup", price: 8.99,  description: "Vegetable Soup is a delicious and nutritious soup made with a variety of fresh vegetables. It is a versatile dish that can include a combination of vegetables such as carrots, celery, onions, peas, corn, and bell peppers. The soup is typically cooked in a flavorful broth and seasoned with herbs and spices to enhance the taste. Vegetable Soup is known for its vibrant colors, comforting aroma, and nourishing qualities. It is a great way to incorporate a variety of vegetables into your diet and is suitable for vegetarians and vegans. Whether enjoyed as a starter or a hearty main course, Vegetable Soup is a wholesome and satisfying option for a balanced meal."),
    
    FoodItem(name: "Taco al Pastor", image: "taco_al_pastor", price: 5.99,  description: "Taco al Pastor is a popular Mexican street food dish that features marinated and spit-roasted pork. It is a flavorful and savory taco option with a distinct blend of spices and cooking techniques. The pork is typically marinated in a combination of spices, such as achiote, garlic, and various chili peppers, which gives it a vibrant red color and rich flavor. The marinated pork is then slowly cooked on a vertical spit, similar to the method used for shawarma or gyros. Once cooked, the tender and juicy pork is thinly sliced and served in warm corn tortillas. Taco al Pastor is often garnished with chopped onions, fresh cilantro, and a squeeze of lime for added freshness. It is a delicious and satisfying choice for taco lovers, offering a delightful combination of flavors and textures."),
    FoodItem(name: "Taco de Asada", image: "taco_de_asada", price: 6.99,  description: "Taco de Asada is a classic Mexican street food dish that showcases grilled and thinly sliced beef. It is a flavorful and savory taco option that is loved for its simple yet delicious combination of ingredients. The beef, often skirt or flank steak, is marinated in a mixture of citrus juices, garlic, and various spices to enhance its taste. It is then grilled to perfection, resulting in tender and juicy meat with a smoky flavor. The grilled beef is thinly sliced and served in warm corn tortillas. Taco de Asada is typically garnished with chopped onions, fresh cilantro, and a squeeze of lime to add brightness and freshness. It is a satisfying choice for taco enthusiasts, offering a delightful balance of flavors and textures."),
    FoodItem(name: "Taco de Pescado", image: "taco_de_pescado", price: 7.99,  description: "Taco de Pescado is a delightful Mexican street food dish that features crispy battered and fried fish. It is a popular taco option for seafood lovers, offering a tasty combination of flavors and textures. The fish, commonly white fish such as cod or tilapia, is coated in a seasoned batter and deep-fried until golden and crispy. The result is tender and flaky fish with a satisfying crunch. Taco de Pescado is typically served in warm corn tortillas and garnished with shredded cabbage, fresh cilantro, and a tangy sauce such as salsa verde or chipotle mayo. The combination of the crispy fish, crunchy cabbage, and zesty sauce creates a delightful contrast of textures and flavors. It is a refreshing and delicious choice for taco enthusiasts, bringing a taste of the sea to your plate."),
    FoodItem(name: "Taco de Pollo", image: "taco_de_pollo", price: 6.99,  description: "Taco de Pollo is a delicious Mexican street food dish that showcases flavorful grilled chicken. It is a popular taco option that combines tender and juicy chicken with a variety of vibrant flavors. The chicken is marinated in a blend of spices, such as cumin, paprika, garlic, and chili powder, to enhance its taste. It is then grilled to perfection, resulting in smoky and succulent chicken. Taco de Pollo is typically served in warm corn tortillas and garnished with diced onions, fresh cilantro, and a squeeze of lime for added freshness. Additional toppings such as salsa, guacamole, or shredded cheese can also be added to enhance the flavors. The combination of the grilled chicken, aromatic spices, and vibrant garnishes creates a mouthwatering taco experience. It is a satisfying and flavorful choice for taco enthusiasts, perfect for enjoying the bold and delicious flavors of Mexican cuisine."),
    FoodItem(name: "Taco de Carnitas", image: "taco_de_carnitas", price: 7.99,  description: "Taco de Carnitas is a mouthwatering Mexican street food dish that highlights tender and juicy slow-cooked pork. It is a popular taco option known for its rich flavors and succulent texture. Carnitas, which means little meats in Spanish, involves simmering pork in a flavorful broth until it becomes incredibly tender. The pork is then shredded or chopped and pan-fried to achieve a crispy exterior while retaining its moistness. Taco de Carnitas is traditionally served in warm corn tortillas and garnished with diced onions, fresh cilantro, and a squeeze of lime. Additional toppings such as salsa, guacamole, or pickled jalapeños can be added to enhance the taste. The combination of the savory, melt-in-your-mouth pork, aromatic spices, and zesty garnishes creates a delightful taco experience. It is a satisfying and indulgent choice for taco enthusiasts, allowing them to savor the deliciousness of slow-cooked pork."),
    
    
    
    FoodItem(name: "Nigiri", image: "nigiri_sushi", price: 8.99, description: "Nigiri Sushi is a popular type of sushi that consists of a small hand-formed mound of vinegared sushi rice topped with a slice of fresh seafood or other ingredients. It is a classic and elegant sushi presentation that showcases the simplicity and quality of the ingredients. The sushi rice is carefully seasoned with a blend of rice vinegar, sugar, and salt to provide a balanced and flavorful base. The topping can vary and may include fish such as tuna, salmon, or yellowtail, as well as seafood like shrimp or octopus. Nigiri Sushi is often served with a dab of wasabi between the rice and the topping, and it is enjoyed with soy sauce for dipping. It offers a delightful combination of textures and flavors, making it a favorite choice among sushi enthusiasts."),
    FoodItem(name: "Maki", image: "maki_sushi", price: 9.99, description: "Maki Sushi is a type of sushi roll made by wrapping sushi rice and various ingredients in a sheet of seaweed called nori. It is a popular and versatile sushi option that comes in different fillings and flavors. The sushi rice is spread evenly on the nori sheet, and then ingredients such as fish, vegetables, or other seafood are placed on top. The roll is tightly rolled using a bamboo mat and then sliced into bite-sized pieces. Maki Sushi can have different variations, including classic rolls like California Roll or Spicy Tuna Roll, as well as vegetarian options like Avocado Roll or Cucumber Roll. It is often served with soy sauce, wasabi, and pickled ginger for added flavor. Maki Sushi offers a delightful combination of textures and tastes, making it a popular choice for sushi lovers."),
    FoodItem(name: "Uramaki", image: "uramaki_sushi", price: 10.99, description: "Uramaki Sushi, also known as inside-out roll, is a type of sushi roll where the rice is on the outside and the seaweed (nori) is on the inside. It is a popular and visually appealing sushi option that offers a variety of fillings and flavors. The sushi rice is spread on a sheet of nori, and then a layer of ingredients such as fish, vegetables, or seafood is added. The roll is then wrapped using a bamboo mat, and sometimes the outer layer of rice is coated with sesame seeds or fish roe for added texture and presentation. Uramaki Sushi can have different fillings and combinations, including favorites like California Roll or Spider Roll. It is often served with soy sauce, wasabi, and pickled ginger. Uramaki Sushi offers a delightful blend of flavors, textures, and visual appeal, making it a popular choice among sushi enthusiasts."),
    FoodItem(name: "Temaki", image: "temaki_sushi", price: 9.99, description: "Temaki Sushi, also known as hand roll, is a type of sushi that is rolled by hand into a cone shape using a sheet of nori (seaweed). It is a popular and interactive sushi option that allows for customization and enjoyment of fresh flavors. A piece of nori is shaped into a cone, and then sushi rice and various fillings such as fish, vegetables, or seafood are added to the center. The cone is then rolled up by hand, creating a portable and easy-to-eat sushi roll. Temaki Sushi offers a balance of textures and flavors, with the crispness of nori, the softness of rice, and the freshness of the fillings. It is often served with soy sauce, wasabi, and pickled ginger. Temaki Sushi provides a fun and hands-on sushi experience, making it a favorite choice for sushi lovers."),
    FoodItem(name: "Sashimi", image: "sashimi_sushi", price: 11.99, description: "Sashimi Sushi is a traditional Japanese dish that consists of fresh, raw seafood or fish sliced into thin pieces. It is a pure and simple form of sushi that showcases the natural flavors and textures of the ingredients. Sashimi is typically served without rice or seaweed, allowing the focus to be on the quality and freshness of the seafood. Common types of sashimi include tuna, salmon, yellowtail, and shrimp, but there are many other varieties available. Sashimi is often presented artfully on a platter and garnished with shredded daikon radish, shiso leaves, or other decorative elements. It is commonly enjoyed with soy sauce and wasabi for dipping. Sashimi Sushi offers a delightful experience for seafood enthusiasts, highlighting the delicate flavors and exquisite presentation of raw fish.")
    
    
    
    
 
]
struct SearchView: View {
    
    @EnvironmentObject private var cart: CartViewModel
    
    @State private var searchText = ""
    @State private var showDetails = false
    @State private var selectedItem: FoodItem?
    
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText, placeholder: "Search...")

                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                        ForEach(allItems.filter({ searchText.isEmpty ? true : $0.name.contains(searchText) })) { item in
                            Button(action: {
                                selectedItem = item
                                showDetails.toggle()
                            }) {
                                ItemView(item: item)
                            }
                        }
                    }
                    .padding()
                }

                if let selectedItem = selectedItem {
                    VStack(alignment: .leading) {
                        Text(selectedItem.name)
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.top)

                        HStack {
                            Text("Price:")
                                .font(.body)
                                .fontWeight(.semibold)
                            Text("\(selectedItem.price, specifier: "%.2f")")
                                .font(.body)
                                .fontWeight(.medium)
                        }

                        Button(action: {
                            cart.addToCart(item: CartItem(name: selectedItem.name, image: selectedItem.image, price: selectedItem.price, quantity: 1))  // added selectedItem's properties
                        }) {
                            Text("Add to Cart")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.orange)
                                .cornerRadius(10)
                        }
                    }
                    .padding()
                }

                Spacer()
            }
            .sheet(isPresented: $showDetails) {
                if let selectedItem = selectedItem {
                    DetailView(item: selectedItem)
                }
            }
            .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
            .navigationBarTitle("Search", displayMode: .inline)
        }
    }

    private func ItemView(item: FoodItem) -> some View {
        VStack {
            Image(item.image)
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
            Text(item.name)
                .foregroundColor(.orange)
                .fontWeight(.medium)
                .italic()
        }
        .background(Color(.systemGroupedBackground))
        .cornerRadius(10)
    }
}

struct SearchBar: UIViewRepresentable {
    @Binding var text: String
    var placeholder: String

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar()
        searchBar.delegate = context.coordinator
        searchBar.placeholder = placeholder
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }

    class Coordinator: NSObject, UISearchBarDelegate {
        let parent: SearchBar

        init(_ parent: SearchBar) {
            self.parent = parent
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            parent.text = searchText
        }

        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder()
        }
    }
}

struct DetailView: View {
    var item: FoodItem
    
    var body: some View {
        VStack {
            Image(item.image)
                .resizable()
                .scaledToFit()
                .padding()
            
            Text(item.name)
                .font(.title)
                .fontWeight(.bold)
                .padding(.vertical)
            
            Text(item.description)
                .font(.body)
                .padding()
            
            Spacer()
        }
        .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
        .navigationBarItems(trailing: Button(action: {}, label: {}))
        .navigationBarBackButtonHidden(false)
    }
}
