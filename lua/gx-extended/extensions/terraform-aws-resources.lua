local M = {}

function M.setup(config)
  local lib = require("gx-extended.lib")
  lib.setup(config)

  lib.register({
    autocmd_pattern = { "*.tf" },
    match_to_url = function(line_string)
      local resource_name = string.match(line_string, 'resource "aws_([^"]*)"')
      local url = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/" .. resource_name

      return url
    end,
  })
end

return M