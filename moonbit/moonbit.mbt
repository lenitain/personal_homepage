fn main {
  let config = site_config()
  println(config_to_json(config))
  let _ = search_projects(config.projects, "")
  let _ = skills_by_category(config.skills)
}
