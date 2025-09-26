import { defineConfig } from 'vitepress';

// https://vitepress.dev/reference/site-config
export default defineConfig({
  title: "Learning Rust",
  description: "A docs site for learning rust, from the book.",
  rewrites: {
    "chapter00/foreword": "foreword"
  },
  themeConfig: {
    base: '/learn-rust/',
    search: {
      provider: 'local'
    },
    footer: {
      message: 'Created by Mouli Bheemaneti',
      copyright: 'Made with ❤️ for Rust 🦀 — Happy Learning!'
    },
    // https://vitepress.dev/reference/default-theme-config
    nav: [
      { text: 'Home', link: '/' },
      { text: 'Chapters', link: '/chapter00/foreword' },
      { text: 'Official Book', link: 'https://doc.rust-lang.org/stable/book/' },
    ],

    sidebar: [
      {
        items: [
          { text: 'Get Started!', link: '/get-started' },
          { text: 'Foreword', link: '/chapter00/foreword' },
          { text: 'Introduction', link: '/chapter00/introduction' },
          {
            text: 'Chapter 1',
            collapsible: true,
            collapsed: false,
            items: [
              { text: '1.1. Installation', link: '/chapter01/11-installation' },
              { text: '1.2. Hello, World!', link: '/chapter01/12-hello-world' },
              { text: '1.3. Hello, Cargo!', link: '/chapter01/13-hello-cargo' },
              // Add more topics as needed
            ]
          },
        ]
      }
    ],

    socialLinks: [
      { icon: 'github', link: 'https://github.com/vuejs/vitepress' }
    ]
  }
})
