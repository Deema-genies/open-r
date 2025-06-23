CREATE TABLE Ingredient (
    ingredient_id integer PRIMARY KEY    -- Example: 1,
    category text                        -- Example: 'Spices',
    name text                            -- Example: 'Salt',
    plural text                          -- Example: 'Savories'
);

CREATE TABLE Recipe (
    recipe_id integer PRIMARY KEY        -- Example: 214,
    title text                           -- Example: 'Raspberry Chiffon Pie',
    subtitle text                        -- Example: 'with Banana Cream Whip',
    servings integer                     -- Example: 10,
    yield_unit text                      -- Example: '1 pie',
    prep_min integer                     -- Example: 20,
    cook_min integer                     -- Example: 8,
    stnd_min integer                     -- Example: 305,
    source text                          -- Example: 'The California Tree Fruit Agreement',
    intro text                           -- Example: 'Serve in stemmed glasses and top with sliced apricots for elegant endings.',
    directions text                      -- Example: 'For crust, preheat oven to 375 degrees F.
In lightly greased 10-inch pie plate, '
);

CREATE TABLE Nutrition (
    recipe_id integer PRIMARY KEY        -- Example: 214,
    protein real                         -- Example: 5.47,
    carbo real                           -- Example: 41.29,
    alcohol real                         -- Example: 0.0,
    total_fat real                       -- Example: 11.53,
    sat_fat real                         -- Example: 2.21,
    cholestrl real                       -- Example: 1.39,
    sodium real                          -- Example: 260.78,
    iron real                            -- Example: 0.81,
    vitamin_c real                       -- Example: 8.89,
    vitamin_a real                       -- Example: 586.2,
    fiber real                           -- Example: 0.87,
    pcnt_cal_carb real                   -- Example: 56.8,
    pcnt_cal_fat real                    -- Example: 35.68,
    pcnt_cal_prot real                   -- Example: 7.53,
    calories real                        -- Example: 290.79,
    FOREIGN KEY (recipe_id) REFERENCES Recipe(recipe_id)
);

CREATE TABLE Quantity (
    quantity_id integer PRIMARY KEY      -- Example: 1,
    recipe_id integer                    -- Example: 214,
    ingredient_id integer                -- Example: 1613,
    max_qty real                         -- Example: 2.0,
    min_qty real                         -- Example: 2.0,
    unit text                            -- Example: 'cup(s)',
    preparation text                     -- Example: 'melted',
    optional text                        -- Example: 'FALSE',
    FOREIGN KEY (recipe_id) REFERENCES Nutrition(recipe_id),
    FOREIGN KEY (ingredient_id) REFERENCES Ingredient(ingredient_id),
    FOREIGN KEY (recipe_id) REFERENCES Recipe(recipe_id)
);