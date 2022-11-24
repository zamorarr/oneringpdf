
<!-- README.md is generated from README.Rmd. Please edit that file -->

# oneringpdf

<!-- badges: start -->
<!-- badges: end -->

The goal of **oneringpdf** is to generate PDF character sheets for One
Ring RPG 2e

## Installation

You can install the development version of oneringpdf like so:

``` r
remotes::install_github("zamorar/oneringpdf")
```

## Example

This is a basic example of how to fill in and create a pdf character
sheet.

``` r
library(oneringpdf)

# get blank fields to fill in
fields <- get_fields()

# fill in fields
fields <- fields |>
  set_name("Fred Foxglow") |>
  set_culture("Men of Bree", "Bree-Blood") |>
  set_calling("Scholar", "Lure of Secrets") |>
  set_patron("Gandalf the Grey") |>
  set_features(c("Cunning", "Inquisitive", "Rhymes of Lore")) |>
  set_flaws("Too Handsome") |> 
  set_standard_of_living("Common", 90) |>
  set_age(30)

fields <- fields |>
  set_strength(3, 17, 23) |>
  set_heart(4, 16, 14) |>
  set_wits(7, 13, 18)

# favored skills
fields <- fields |>
  set_skills_favored(c("Craft", "Insight", "Lore"))

# skill values
fields <- fields |>
  # Strength
  set_skill_level("Awe", 0) |>
  set_skill_level("Athletics", 1) |>
  set_skill_level("Awareness", 1) |>
  set_skill_level("Hunting", 2) |>
  set_skill_level("Song", 1) |>
  set_skill_level("Craft", 1) |>
  # Heart
  set_skill_level("Enhearten", 2) |>
  set_skill_level("Travel", 2) |>
  set_skill_level("Insight", 2) |>
  set_skill_level("Healing", 1) |>
  set_skill_level("Courtesy", 3) |>
  set_skill_level("Battle", 0) |>
  # Wits
  set_skill_level("Persuade", 2) |>
  set_skill_level("Stealth", 1) |>
  set_skill_level("Scan", 2) |>
  set_skill_level("Explore", 1) |>
  set_skill_level("Riddle", 2) |>
  set_skill_level("Lore", 2)

# combat profs
fields <- fields |>
  set_proficiency_level("Axes", 0) |>
  set_proficiency_level("Bows", 1) |>
  set_proficiency_level("Spears", 2) |>
  set_proficiency_level("Swords", 0)

# weapons
fields <- set_weapons(
  fields,
  weapon = c("Spear (Keen)", "Bow"),
  damage = c(4, 3),
  injury = c("16", "14"),
  load = c(3, 2),
  notes = c("Two-handed", ""))

# armour
fields <- fields |>
  set_armour("Leather Shirt", "1d", 3)

# traveling gear
fields <- fields |>
  set_travelling_gear(c(
    "A fine pipe to find comfort (Insight)",
    "A sunstone to navigate in bad weather (Travel)"
  ))

# current values
fields <- fields |>
  set_points(0, 0, 0) |>
  set_current_endurance(23, 8, 0) |>
  set_current_hope(14, 0, 0)


# rewards and virtues
fields <- fields |>
  set_valour(1, "Keen") |>
  set_wisdom(1, "Nimbleness")

# conditions
fields <- fields |>
  set_conditions()
```

``` r
# write fields to pdf based on template (men, dwarf, elf, hobbit)
write_pdf(fields, outputfile = "mycharacter.pdf", template = "men")
```
