///|
pub fn site_config() -> SiteConfig {
  SiteConfig::{
    name: "Your Name",
    tagline: "Developer · Open Source Enthusiast · Lifelong Learner",
    avatar: "",
    projects: [
      Project::{
        title: "project-alpha",
        description: "A cool project built with MoonBit and Vue",
        url: "https://github.com/lenitain/personal_homepage",
        tags: ["MoonBit", "Vue", "TypeScript"],
      },
      Project::{
        title: "project-beta",
        description: "Another awesome project",
        url: "https://github.com/you/project-beta",
        tags: ["Rust", "WebAssembly"],
      },
      Project::{
        title: "project-gamma",
        description: "Yet another project worth mentioning",
        url: "https://github.com/you/project-gamma",
        tags: ["Python", "ML"],
      },
    ],
    skills: [
      Skill::{ name: "MoonBit", category: "Languages", level: 3 },
      Skill::{ name: "Vue", category: "Frameworks", level: 4 },
      Skill::{ name: "Rust", category: "Languages", level: 4 },
      Skill::{ name: "TypeScript", category: "Languages", level: 4 },
      Skill::{ name: "Python", category: "Languages", level: 3 },
      Skill::{ name: "Tailwind CSS", category: "Frameworks", level: 3 },
    ],
    socials: [
      SocialLink::{
        platform: "GitHub",
        url: "https://github.com/you",
        icon: "github",
      },
      SocialLink::{
        platform: "Email",
        url: "mailto:you@example.com",
        icon: "mail",
      },
    ],
    posts: [
      BlogPost::{
        title: "Getting Started with MoonBit",
        url: "#",
        date: "2026-04-01",
      },
      BlogPost::{
        title: "Building a Personal Site with Vue + MoonBit",
        url: "#",
        date: "2026-03-15",
      },
    ],
  }
}
