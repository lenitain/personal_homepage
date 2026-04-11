///|
pub fn site_config() -> SiteConfig {
  SiteConfig::{
    name: "朱信童",
    site_title: "朱信童 - 个人主页",
    tagline: "Developer · Open Source Enthusiast · Lifelong Learner",
    avatar: "",
    projects: [
      Project::{
        title: "dotfiles",
        description: "Configuration files optimized for CachyOS + Niri environment",
        url: "https://github.com/lenitain/dotfiles",
        tags: ["configuration", "Lua", "shell"],
      },
      Project::{
        title: "fsmon",
        description: "A cli tool that records file changes",
        url: "https://github.com/lenitain/fsmon",
        tags: ["Rust", "Linux syscall", "filesystem", "cli"],
      },
      Project::{
        title: "gaze_vibe",
        description: "Eye track assisted code generating tool",
        url: "https://github.com/lenitain/gaze_vibe",
        tags: ["Python", "LLM", "Vue"],
      },
    ],
    skills: [
      Skill::{ name: "MoonBit", category: "Languages", level: 3 },
      Skill::{ name: "Vue", category: "Frameworks", level: 3 },
      Skill::{ name: "Rust", category: "Languages", level: 4 },
      Skill::{ name: "JavaScript", category: "Languages", level: 3 },
      Skill::{ name: "Python", category: "Languages", level: 4 },
    ],
    socials: [
      SocialLink::{
        platform: "GitHub",
        url: "https://github.com/lenitain",
        icon: "github",
      },
      SocialLink::{
        platform: "Email",
        url: "mailto:xt.zhu@qq.com",
        icon: "mail",
      },
    ],
    posts: posts_data(),
  }
}
