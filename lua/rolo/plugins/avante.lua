return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  build = "make",

  ---@module 'avante'
  ---@type avante.Config
  opts = {
    instructions_file = "avante.md",
    provider = "ollama", -- cambiás el provider acá

    providers = {
      claude = {
        endpoint = "https://api.anthropic.com",
        model = "claude-sonnet-4-20250514",
        timeout = 30000,
        extra_request_body = {
          temperature = 0.75,
          max_tokens = 20480,
        },
      },

      moonshot = {
        endpoint = "https://api.moonshot.ai/v1",
        model = "kimi-k2-0711-preview",
        timeout = 30000,
        extra_request_body = {
          temperature = 0.75,
          max_tokens = 32768,
        },
      },

      ollama = {
        endpoint = "http://10.101.2.191:11434", -- puerto de Ollama
        model = "gpt-oss:20b",
        timeout = 60000,
        extra_request_body = {
          temperature = 0.5,
          max_tokens = 12288,
          stream = true,
        },
      },
    },
  },

  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",

    -- opcionales
    "nvim-telescope/telescope.nvim",
    "hrsh7th/nvim-cmp",
    "stevearc/dressing.nvim",
    "nvim-tree/nvim-web-devicons",

    {
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          use_absolute_path = true,
        },
      },
    },

    {
      "MeanderingProgrammer/render-markdown.nvim",
      ft = { "markdown", "Avante" },
      opts = {
        file_types = { "markdown", "Avante" },
      },
    },
  },
}
