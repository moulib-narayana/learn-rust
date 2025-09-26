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
          { text: 'Foreword', link: '/chapter00/foreword' },
          { text: 'Introduction', link: '/chapter00/introduction' },
          {
            text: 'Chapter 1',
            collapsible: true,
            collapsed: false,
            items: [
              { text: 'What is Ownership?', link: '/chapter01/ownership' },
              { text: 'References and Borrowing', link: '/chapter01/references-and-borrowing' },
              { text: 'Slices', link: '/chapter01/slices' },
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
