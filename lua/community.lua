-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- Mapping
  { import = "astrocommunity.recipes.picker-lsp-mappings" },
  -- Languages
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.zig" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.pack.kotlin" },
  { import = "astrocommunity.pack.php" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.fish" },
  { import = "astrocommunity.pack.python-ruff" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.fish" },
  -- { import = "astrocommunity.pack.godot" },
  { import = "astrocommunity.pack.cs" },
  -- Tools
  { import = "astrocommunity.pack.biome" },
  { import = "astrocommunity.pack.eslint" },
  -- Frameworks
  { import = "astrocommunity.pack.svelte" },
  { import = "astrocommunity.pack.angular" },
  { import = "astrocommunity.pack.vue" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.spring-boot" },
  -- Data formats
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.proto" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.xml" },
  { import = "astrocommunity.pack.html-css" },
  -- Themes
  { import = "astrocommunity.colorscheme.nordic-nvim" },
  -- Other
  { import = "astrocommunity.docker.lazydocker" },
  { import = "astrocommunity.editing-support.todo-comments-nvim" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.cmake" },
  { import = "astrocommunity.pack.sql" },
  { import = "astrocommunity.pack.terraform" },
}
