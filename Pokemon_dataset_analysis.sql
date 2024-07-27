CREATE database projects;
Use projects; 
SELECT * FROM pokemons;

-- Q1 Find the name and type1 and type2 of pokemon
SELECT name, type1record, type2 FROM pokemons;

-- Q2 List all unique Pokémon types in type1.
SELECT DISTINCT type1 FROM pokemons;

-- Q3 Count the number of Pokémon in the dataset
SELECT COUNT(*) FROM pokemons;

-- Q4 Find the average height of all pokemons
SELECT AVG(height) FROM pokemons;

-- Q5 List the names of all Pokémon with a height greater than 2 meters.
SELECT name FROM pokemons WHERE height > 2;

-- Q6 Retireive name and base exp of all pokemon
SELECT name, base_exp FROM pokemons;

-- Q7 Find the pokemon with highest base experience.
SELECT name, base_exp FROM pokemons ORDER BY base_exp DESC LIMIT 1;

-- Q8 List all the pokemon with a base frienship of 70
SELECT name FROM pokemons WHERE base_friendship = 70;

-- Q9 Count the number of pokemon in each generations
SELECT generation, COUNT(*) AS count FROM pokemons GROUP BY generation;

-- Q10  Find all pokemon with specific type
SELECT name
FROM pokemons
WHERE type1 = 'Fire';

-- Q11  Get average height and weight
SELECT AVG(height) AS avg_height, AVG(weight) AS avg_weight
FROM pokemons;

-- Q12 Find pokemon that have type fire and can fly
SELECT name
FROM pokemons
WHERE type1 = 'Fire' AND type2= 'Flying' ;

-- Q13 
SELECT name
FROM pokemons
WHERE egg_group1 = 'Bug' AND egg_group2= 'Water';

-- Q14 Find the Pokemon with the highest base stat total:
SELECT name, total
FROM pokemons
ORDER BY total DESC
LIMIT 1;

-- Q15 Count the number of Pokemon in each generation
SELECT generation, COUNT(*) AS count
FROM pokemons
GROUP BY generation;

-- Q16 Find Pokemon with hidden abilities:
SELECT name, hidden_ability
FROM pokemons
WHERE hidden_ability IS NOT NULL;

-- Q17 Get pokemon with only 1 type
SELECT name, type1
FROM pokemons
WHERE type2 IS NULL;

-- Q18 List the top 5 heaviest Pokemon
SELECT name, weight
FROM pokemons
ORDER BY weight DESC
LIMIT 5;

-- Q19 Calculate the catch rate percentage for all Pokemon
SELECT name, catch_rate / 255 * 100 AS catch_rate_percent
FROM pokemons;

-- Q20 Identify Pokemon with a higher base attack stat than their special attack stat and vice versa
SELECT name,
  CASE WHEN attack > sp_atk THEN 'Physical'
       WHEN attack < sp_atk THEN 'Special'
       ELSE 'Equal'
  END AS stronger_stat
FROM pokemons;

-- Q21 Identify Pokemon that can evolve into another Pokemon in the dataset
SELECT p1.name AS base_pokemon, p2.name AS evolved_pokemon
FROM pokemons p1
INNER JOIN pokemon p2 ON p1.evolves_to = p2.id;

-- Q22 Find the Pokémon with the highest attack
SELECT name, attack FROM pokemons ORDER BY attack DESC LIMIT 1;

-- Q23  List the top 5 Pokémon by total stats
SELECT name, total FROM pokemons ORDER BY total DESC LIMIT 5;

-- Q24 Find the most common primary type (type1) among Pokémon
SELECT type1, COUNT(*) AS count FROM pokemons GROUP BY type1 ORDER BY count DESC LIMIT 1;

-- Q25 Calculate the average defense for each type (type1)
SELECT type1, AVG(defense) AS avg_defense FROM pokemon_stats GROUP BY type1;

-- Q26 Find the Pokémon with the highest speed in each generation.
SELECT generation, name, speed
FROM (
  SELECT generation, name, speed, 
         ROW_NUMBER() OVER (PARTITION BY generation ORDER BY speed DESC) as rank1
  FROM pokemons
) AS ranked
WHERE rank1 = 1;

-- Q27 List the names of all Pokémon with a hidden ability
SELECT name FROM pokemons WHERE hidden_ability IS NOT NULL;

-- Q28 Retrieve the average special attack (spatk) of Pokémon for each egg group (eggofgroup1).
SELECT egg_group1, AVG(sp_atk) AS avg_spatk FROM pokemons GROUP BY egg_group1;

-- Q29 Find the Pokémon with the highest catch rate
SELECT name, catch_rate FROM pokemons ORDER BY catch_rate DESC LIMIT 1;

-- Q30 List the top 5 Pokémon with the highest base friendship.
SELECT name, base_friendship FROM pokemons ORDER BY base_friendship DESC LIMIT 5;

-- Q31 Count the number of Pokémon with more than one ability (ability2 is not NULL)
SELECT COUNT(*) FROM pokemons WHERE ability2 IS NOT NULL;

-- Q32 Find the Pokémon with the highest average stats (total stats) per generation.
SELECT generation, name, total
FROM (
  SELECT generation, name, total,
         ROW_NUMBER() OVER (PARTITION BY generation ORDER BY total DESC) as ranks
  FROM pokemons
) AS ranked
WHERE ranks = 1;

-- Q33 Calculate the correlation between attack and defense for all Pokémon
SELECT CORR(attack, defense) AS correlation FROM pokemons;

-- Q34 List the names of all Pokémon that belong to both 'Monster' and 'Dragon' egg
 SELECT name FROM pokemons WHERE (egg_group1 = 'Monster' AND egg_group2 = 'Dragon') OR (egg_group1 = 'Dragon' AND egg_group2 = 'Monster');

-- Q35 Find the Pokémon with the highest ratio of special attack to special defens
SELECT name, sp_atk / sp_def AS spatk_spdef_ratio
FROM pokemons
ORDER BY spatk_spdef_ratio DESC
LIMIT 1;

-- Q36 List the names and total stats of Pokémon that have no hidden ability but belong to the 'Water1' egg group.
SELECT name, total FROM pokemons WHERE hidden_ability IS NULL AND (egg_group1 = 'Water1' OR egg_group2 = 'Water1');

-- Q37  Calculate the average base experience for Pokémon in each growth rate
SELECT growth_rate, AVG(base_exp) AS avg_baseexp FROM pokemons GROUP BY growth_rate;

-- Q38 Find the Pokémon with the highest total stats within each type1 and type2 combination.
SELECT type1, type2, name, total
FROM (
  SELECT type1, type2, name, total,
         ROW_NUMBER() OVER (PARTITION BY type1, type2 ORDER BY total DESC) as rank2
  FROM pokemons
) AS ranked
WHERE rank2 = 1;

-- Q39 List the top 10 Pokémon with the lowest percent of male.
SELECT name, percent_male FROM pokemons ORDER BY percent_male ASC LIMIT 10;

-- Q40 Retrieve the average speed of Pokémon for each species.
SELECT species, AVG(speed) AS avg_speed FROM pokemons GROUP BY species;

-- Q41 Find the Pokémon with the highest base experience in each egg group combination.
SELECT egg_group1, egg_group2, name, base_exp
FROM (
  SELECT egg_group1, egg_group2, name, base_exp,
         ROW_NUMBER() OVER (PARTITION BY egg_group1, egg_group2 ORDER BY base_exp DESC) as ranky
  FROM pokemons
) AS ranked
WHERE ranky = 1;

-- Q42 : Find the Pokémon with the highest combined total of attack and special attack.
SELECT name, (attack + sp_atk) AS combined_attack
FROM pokemons
ORDER BY combined_attack DESC
LIMIT 1;

-- Q43 List the names of all Pokémon that have an HP higher than their attack and defense combined.
SELECT name
FROM pokemons
WHERE hp > (attack + defense);

-- Q44 Retrieve the top 3 Pokémon with the highest special defense to defense ratio.
SELECT name, (sp_def / defense) AS spdef_def_ratio
FROM pokemons
ORDER BY spdef_def_ratio DESC
LIMIT 3;

-- Q45 Find the Pokémon that has the smallest height among those with total stats greater than 500.
SELECT name, height
FROM pokemons
WHERE total > 500
ORDER BY height ASC
LIMIT 1;

-- Q46 List the Pokémon names and their growth rates for Pokémon that have the highest base experience in their respective growth rates.
SELECT growthrate, name, baseexp
FROM (
  SELECT growthrate, name, baseexp,
         ROW_NUMBER() OVER (PARTITION BY growthrate ORDER BY baseexp DESC) as ranke
  FROM pokemons
) AS ranked
WHERE ranke = 1;

-- Q47 Calculate the average total stats of Pokémon for each egg cycle group.
SELECT egg_cycles, AVG(total) AS avg_total
FROM pokemons
GROUP BY egg_cycles;

-- Q48 Find the Pokémon that have no secondary type and have the highest special attack.
SELECT name, sp_atk
FROM pokemons
WHERE type2 IS NULL
ORDER BY sp_atk DESC
LIMIT 1;

-- Q49 List the names of all Pokémon that have a catch rate less than 50 and belong to the 'Dragon' type
SELECT name
FROM pokemons
WHERE type1 = 'Dragon' AND catch_rate < 50;

-- Q50  Find the Pokémon with the highest sum of percent of male and female
SELECT name, (percent_male + percent_female) AS gender_ratio_sum
FROM pokemons
ORDER BY gender_ratio_sum DESC
LIMIT 1;
