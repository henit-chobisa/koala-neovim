local M = {}

-- Apply the colorscheme.
--   require("koala").setup()         → light  (koala)
--   require("koala").setup("dark")   → dark   (koala-bengaluru)
function M.setup(opts)
  require("koala.theme").setup(opts)
end

return M
