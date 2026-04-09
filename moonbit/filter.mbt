pub fn search_projects(projects : Array[Project], query : String) -> Array[Project] {
  if query == "" {
    return projects
  }
  let q = query.to_lower()
  projects.filter(fn(p) {
    p.title.to_lower().contains(q) || p.description.to_lower().contains(q) || p.tags.any(fn(t) { t.to_lower().contains(q) })
  })
}

pub fn skills_by_category(skills : Array[Skill]) -> Array[(String, Array[Skill])] {
  let seen : Array[String] = []
  let result : Array[(String, Array[Skill])] = []
  for skill in skills {
    if !seen.contains(skill.category) {
      seen.push(skill.category)
      let group = skills.filter(fn(s) { s.category == skill.category })
      result.push((skill.category, group))
    }
  }
  result
}
