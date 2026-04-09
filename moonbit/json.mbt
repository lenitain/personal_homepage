fn escape_json(s : String) -> String {
  s.replace(old="\\", new="\\\\").replace(old="\"", new="\\\"").replace(old="\n", new="\\n").replace(old="\r", new="\\r").replace(old="\t", new="\\t")
}

fn json_string(s : String) -> String {
  let escaped = escape_json(s)
  "\"\{escaped}\""
}

fn json_array_str(arr : Array[String]) -> String {
  let items = arr.map(fn(s) { json_string(s) }).join(", ")
  "[\{items}]"
}

fn json_project(p : Project) -> String {
  let tags = json_array_str(p.tags)
  "{\"title\":\{json_string(p.title)},\"description\":\{json_string(p.description)},\"url\":\{json_string(p.url)},\"tags\":\{tags}}"
}

fn json_skill(s : Skill) -> String {
  "{\"name\":\{json_string(s.name)},\"category\":\{json_string(s.category)},\"level\":\{s.level.to_string()}}"
}

fn json_social(s : SocialLink) -> String {
  "{\"platform\":\{json_string(s.platform)},\"url\":\{json_string(s.url)},\"icon\":\{json_string(s.icon)}}"
}

fn json_post(p : BlogPost) -> String {
  "{\"title\":\{json_string(p.title)},\"url\":\{json_string(p.url)},\"date\":\{json_string(p.date)}}"
}

pub fn config_to_json(config : SiteConfig) -> String {
  let projects_json = config.projects.map(json_project).join(", ")
  let skills_json = config.skills.map(json_skill).join(", ")
  let socials_json = config.socials.map(json_social).join(", ")
  let posts_json = config.posts.map(json_post).join(", ")
  "{\"name\":\{json_string(config.name)},\"tagline\":\{json_string(config.tagline)},\"avatar\":\{json_string(config.avatar)},\"projects\":[\{projects_json}],\"skills\":[\{skills_json}],\"socials\":[\{socials_json}],\"posts\":[\{posts_json}]}"
}
