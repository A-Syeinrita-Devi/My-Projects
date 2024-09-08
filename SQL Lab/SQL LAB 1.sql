###QUESTION 3

#create database
CREATE DATABASE NutritionalFact;

USE NutritionalFact; 

#create table
CREATE TABLE Nutrition (
    Food VARCHAR(255),
    Serving_Size_g INT,
    Calories INT,
    TotalFat_g DECIMAL(10,2),
    Sodium_g INT,
    Potassium_g INT,
    TotalCarbohydrate_g INT,
    DietaryFiber_g INT NULL,
    Sugars_g INT NULL,
    Protein_g INT,
    VitaminA_DV INT,
    VitaminC_DV INT,
    Calcium_DV INT,
    SaturatedFat_mg INT NULL,
    Cholesterol_mg INT NULL,
    Food_Type VARCHAR(255)
);

#observe the table
SELECT * FROM nutrition;

###QUESTION 5

#a) List all food name, type(vegetable/fruit/seafood), calories for food with calories more than 100
SELECT Food, Food_Type, Calories
FROM nutrition
WHERE Calories > 100;

#b) List all vegetables name and vitamin C in serving. Sort the output of query in descending order according to the vitamin C.
SELECT Food AS Vegetable_Name , VitaminC_DV AS Vitamin_C
FROM nutrition
WHERE Food_Type = 'Vegetables'
ORDER BY VitaminC_DV DESC;

#c) List all vegetables, fruits and seafood have calories greater than 100/per serving
SELECT Food, Food_Type, Calories
FROM nutrition
WHERE Calories > 100 AND Food_Type IN ('Vegetables', 'Fruits', 'Seafood');

#d) List fruits and vegetables that have name contain a as second character and followed by any characters at any length
SELECT Food, Food_Type
FROM nutrition
WHERE (Food_Type = 'Fruits' OR Food_Type = 'Vegetables') 
AND Food LIKE '_a%';

#e) List the seafood name for seafood name start with R.
SELECT Food, Food_Type
FROM nutrition
WHERE Food_Type = 'Seafood' 
AND Food LIKE 'R%';

#f) List all vegetables and fruits that contain fat
SELECT Food, Food_Type, TotalFat_g
FROM nutrition
WHERE Food_Type IN ('Vegetables', 'Fruits')
AND TotalFat_g >0;

#g) List all vegetables that not contain sodium
SELECT Food, Food_Type,Sodium_g
FROM nutrition
WHERE Food_Type = 'Vegetables'
AND Sodium_g =0;

#h) List vegetables that contain both vitamin A and C
SELECT Food, Food_Type, VitaminA_DV,VitaminC_DV
FROM nutrition
WHERE Food_Type = 'Vegetables'
AND VitaminA_DV AND VitaminC_DV >0 ;

#i) List all fruits that have sugar less than 10 and sort in ascending order
SELECT Food, Sugars_g
FROM nutrition
WHERE Food_Type = 'Fruits' AND Sugars_g <10
ORDER BY Sugars_g ASC;

#j) List all seafood name, serving size, total fat and add the percentage of fat
SELECT Food, Serving_Size_g, TotalFat_g, ROUND((TotalFat_g / Serving_Size_g) * 100, 2) 
AS Fat_Percentage
FROM nutrition
WHERE Food_Type = 'Seafood';


#k) Create view called high_cholesterol seafood that store all the seafood name and cholesterol component with cholesterol 50 and more.
CREATE VIEW high_cholesterol_seafood AS
SELECT Food AS Seafood_Name, Cholesterol_mg
FROM nutrition
WHERE Food = 'Seafood' AND Cholesterol_mg >= 50;

#l) Create view called sodiuhigh_cholesterol_seafoodSeafood_Namem_vegetable that store all vegetable contain sodium.
CREATE VIEW sodium_vegetable AS
SELECT Food
FROM nutrition
WHERE Food = 'Vegetables' AND Sodium_g > 0;

#m) Count the number of fruits that have vitamin A
SELECT COUNT(*) AS Fruits_Count_With_Vitamin_A
FROM nutrition
WHERE Food_Type = 'Fruits' AND VitaminA_DV >0;

#n) Count the number of fruits that have calcium
SELECT COUNT(*) AS Fruits_Count_With_Calcium
FROM nutrition
WHERE Food_Type = 'Fruits' AND Calcium_DV >0;








