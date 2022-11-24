#' Set Character Name
#'
#' @param fields list of pdf fields
#' @param name Character Name
#' @export
set_name <- function(fields, name) {
  fields$Name$value <- name
  fields
}

#' Set Character Culture
#' @inheritParams set_name
#' @param culture Culture name
#' @param blessing Culture blessing
#' @export
set_culture <- function(fields, culture, blessing) {
  fields$`Heroic Culture`$value <- culture
  fields$`Cultural Blessing`$value <- blessing
  fields
}

#' Set Character Calling
#' @inheritParams set_name
#' @param calling Calling name
#' @param shadow_path Calling shadow path
#' @export
set_calling <- function(fields, calling, shadow_path) {
  fields$Calling$value <- calling
  fields$`Shadow Path`$value <- shadow_path
  fields
}

#' Set Fellowship Patron
#' @inheritParams set_name
#' @param patron Patron name
#' @export
set_patron <- function(fields, patron) {
  fields$Patron$value <- patron
  fields
}

#' Set Character Features
#' @inheritParams set_name
#' @param features vector of character features
#' @export
set_features <- function(fields, features) {
  s <- paste(features, collapse = ", ")
  fields$`Distinctive Features A`$value <- s
  #fields$`Distinctive Features B`$value <- "Inquisitive"
  fields
}

#' Set Character Flaws
#' @inheritParams set_name
#' @param flaws vector of character flaws
#' @export
set_flaws <- function(fields, flaws) {
  s <- paste(flaws, collapse = ", ")
  fields$Flaws$value <- s
  fields
}

#' Set Character Strength attribute
#' @inheritParams set_name
#' @param rating Strength Rating
#' @param target Strength Target Number
#' @param endurance Endurance Rating
#' @export
set_strength <- function(fields, rating, target, endurance) {
  fields$`Strength Rating`$value <- rating
  fields$`Strength TN`$value <- target
  fields$Endurance$value <- endurance
  fields
}

#' Set Character Heart attribute
#' @inheritParams set_name
#' @param rating Heart Rating
#' @param target Heart Target Number
#' @param hope Hope Rating
#' @export
set_heart <- function(fields, rating, target, hope) {
  fields$`Heart Rating`$value <- rating
  fields$`Heart TN`$value <- target
  fields$Hope$value <- hope
  fields
}

#' Set Character Wits attribute
#' @inheritParams set_name
#' @param rating Wits Rating
#' @param target Wits Target Number
#' @param parry Parry Rating
#' @export
set_wits <- function(fields, rating, target, parry) {
  fields$`Wits Rating`$value <- rating
  fields$`Wits TN`$value <- target
  fields$`Parry 1`$value <- parry
  fields
}

#' Set favored skills
#' @inheritParams set_name
#' @param skills vector of character skills
#' @export
set_skills_favored <- function(fields, skills) {
  nm <- paste(skills, "-", "Favoured Skill")
  fields[nm] <- lapply(fields[nm], function(x) {
    x$value <- "Ja"
    x
  })
  fields
}

#' Set skill level
#' @inheritParams set_name
#' @param skill Name of skill
#' @param lvl Skill level (integer)
#' @export
set_skill_level <- function(fields, skill, lvl) {
  if(lvl < 1) return(fields)
  nm <- paste(skill, "-", "Rank", seq_len(lvl))
  fields[nm] <- lapply(fields[nm], function(x) {
    x$value <- "Ja"
    x
  })

  fields
}

#' Set Combat Proficiency
#' @inheritParams set_name
#' @param proficiency Name of Proficiency
#' @param lvl Proficiency level (integer)
#' @export
set_proficiency_level <- function(fields, proficiency, lvl) {
  set_skill_level(fields, proficiency, lvl)
}

#' Set weapons (war gear)
#'
#' @inheritParams set_name
#' @param weapon Name of weapon
#' @param damage weapon damage
#' @param injury weapon injury target number
#' @param load load value
#' @param notes notes
#' @export
set_weapons <- function(fields, weapon, damage, injury, load, notes) {
  n <- length(weapon)
  for (i in seq_len(n)) {
    fields[[paste("War Gear", i)]]$value <- weapon[i]
    fields[[paste("Damage", i)]]$value <- damage[i]
    fields[[paste("Injury", i)]]$value <- injury[i]
    fields[[paste("Load", i)]]$value <- load[i]
    fields[[paste("Notes", i)]]$value <- notes[i]
  }

  fields
}

#' Set Armour (war gear)
#'
#' @inheritParams set_name
#' @param armour Name of armour
#' @param protection Protection value
#' @param load Load value
#' @export
set_armour <- function(fields, armour, protection, load) {
  fields$Armour$value <- armour
  fields$`Protection 1`$value <- protection
  fields$`Load 5`$value <- load
  fields
}

#' Set Helm (war gear)
#'
#' @inheritParams set_name
#' @param helm Name of helm
#' @param protection Protection value
#' @param load Load value
#' @export
set_helm <- function(fields, helm, protection, load) {
  fields$Helm$value <- helm
  fields$`Protection 2`$value <- protection
  fields$`Load 6`$value <- load
  fields
}


#' Set Shield (war gear)
#'
#' @inheritParams set_name
#' @param shield Name of shield
#' @param parry Parry value
#' @param load Load value
#' @export
set_shield <- function(fields, shield, parry, load) {
  fields$Shield$value <- shield
  fields$`Parry 2` <- parry
  fields$`Load 7`$value <- load
  fields
}

#' Set Travelling Gear
#'
#' @inheritParams set_name
#' @param gear vector of gear descriptions
#' @export
set_travelling_gear <- function(fields, gear) {
  fields$`Travelling Gear`$value <- paste(gear, collapse = "\n")
  fields
}

#' Set Current Endurance
#'
#' @inheritParams set_name
#' @param endurance Current endurance
#' @param load Current load value
#' @param fatigue Character fatigue
#' @export
set_current_endurance <- function(fields, endurance, load, fatigue) {
  fields$`Current Endurance`$value <- endurance
  fields$Load$value <- load
  fields$Fatigue$value <- fatigue
  fields
}

#' Set Current Hope
#'
#' @inheritParams set_name
#' @param hope Current hope
#' @param shadow Current Shadow
#' @param shadow_scars Character Shadow Scars
#' @export
set_current_hope <- function(fields, hope, shadow, shadow_scars) {
  fields$`Current Hope`$value <- hope
  fields$`Shadow Points`$value <- shadow
  fields$`Shadow Scars`$value <- shadow_scars
  fields
}

#' Set Various Character Points
#'
#' @inheritParams set_name
#' @param adventure Adventure Points
#' @param skill Skill Points
#' @param fellowship Fellowship Points
#' @export
set_points <- function(fields, adventure, skill, fellowship) {
  fields$`Adventure Points`$value <- adventure
  fields$`Skill Points`$value <- skill
  fields$`Fellowship Score`$value <- fellowship
  fields
}

#' Set Character Conditions
#'
#' @inheritParams set_name
#' @param is_weary Boolean
#' @param is_miserable Boolean
#' @param is_wounded Boolean
#' @param injury Injury description
#' @export
set_conditions <- function(fields, is_weary = FALSE, is_miserable = FALSE, is_wounded = FALSE, injury = "") {
  if (is_weary) fields$Weary$value <- "Ja"
  if (is_miserable) fields$Miserable$value <- "Ja"
  if (is_wounded) fields$Wounded$value <- "Ja"
  fields$Injury$value <- injury
  fields
}

#' Set Character Valour and Rewards
#' @inheritParams set_name
#' @param valour Valour value (integer)
#' @param rewards vector of Rewards descriptions
#' @export
set_valour <- function(fields, valour, rewards = "") {
  fields$Valour$value <- valour
  fields$Rewards$value <- paste(rewards, collapse = "\n")
  fields
}

#' Set Character Wisdom and Virtues
#' @inheritParams set_name
#' @param wisdom Wisdom value (integer)
#' @param virtues vector of Virtues descriptions
#' @export
set_wisdom <- function(fields, wisdom, virtues = "") {
  fields$Wisdom$value <- wisdom
  fields$Virtues$value <- paste(virtues, collapse = "\n")
  fields
}

#' Set Character Standard of Living
#' @inheritParams set_name
#' @param living Standard of Living
#' @param treasure Initial treasure value
#' @export
set_standard_of_living <- function(fields, living, treasure) {
  fields$`Standard of Living`$value <- living
  fields$Treasure$value <- treasure
  fields
}

#' Set Character Age
#' @inheritParams set_name
#' @param age Age
#' @export
set_age <- function(fields, age) {
  fields$Age$value <- age
  fields
}

