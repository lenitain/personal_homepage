pub struct Project {
  title : String
  description : String
  url : String
  tags : Array[String]
}

pub struct Skill {
  name : String
  category : String
  level : Int // 1-5
}

pub struct SocialLink {
  platform : String
  url : String
  icon : String
}

pub struct BlogPost {
  title : String
  url : String
  date : String
}

pub struct SiteConfig {
  name : String
  tagline : String
  avatar : String
  projects : Array[Project]
  skills : Array[Skill]
  socials : Array[SocialLink]
  posts : Array[BlogPost]
}
