return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"williamboman/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
	},
	config = function(_, opts)
		local dap = require("dap")
		local dapui = require("dapui")
		local map = vim.keymap.set

		-- 1. Configuración de Mason para el Adaptador
		require("mason-nvim-dap").setup({
			automatic_installation = true,
			ensure_installed = { "js-debug-adapter" },
		})

		-- Definición del Adaptador 'pwa-node'
		--dap.adapters["pwa-node"] = {
		--	type = "server",
		--	host = "localhost",
		--	port = "${port}",
		--	executable = {
		--		-- **VERIFICAR RUTA**: Asegúrate que esta ruta sea correcta para la instalación de Mason en tu sistema.
		--		command = os.getenv("HOME") .. "/.local/share/nvim/mason/bin/js-debug-adapter",
		--		args = { "${port}" },
		--	},
		--}

		dap.adapters["pwa-node"] = {
			type = "server",
			host = "localhost",
			port = "${port}",
			executable = {
				command = "node",
				args = {
					os.getenv("HOME")
						.. "/.local/share/nvim/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
					"${port}",
				},
			},
		}

		-- 2. Configuraciones de Lanzamiento (TypeScript)
		dap.configurations.typescript = {
			-- Configuración de lanzamiento principal
			{
				type = "pwa-node",
				request = "launch",
				name = "Launch file (TS)",
				program = "${file}",
				cwd = "${workspaceFolder}",
				runtimeExecutable = "node",
				-- La línea 'runtimeArgs' es crucial para ts-node/esm, ¡bien hecho!
				runtimeArgs = { "--loader", "ts-node/esm" },
				sourceMaps = true,
				protocol = "inspector",
				skipFiles = {
					"<node_internals>/**",
				},
			},
			-- Configuración para adjuntar a un proceso existente
			{
				type = "pwa-node",
				request = "attach",
				name = "Attach (TS)",
				processId = require("dap.utils").pick_process,
				cwd = "${workspaceFolder}",
			},
			{
				name = "Attach NestJS",
				type = "pwa-node",
				request = "attach",
				port = 9229,
				cwd = "${workspaceFolder}",
				sourceMaps = true,
				protocol = "inspector",
				outFiles = { "${workspaceFolder}/dist/**/*.js" },
			},
		}

		-- 3. Configuraciones de Lanzamiento (JavaScript)
		dap.configurations.javascript = {
			-- ▶️ Ejecutar archivo JS directamente
			{
				type = "pwa-node",
				request = "launch",
				name = "Launch JS",
				program = "${file}",
				cwd = "${workspaceFolder}",
				protocol = "inspector",
				skipFiles = { "<node_internals>/**" },
			},

			-- 🟩 Attach a cualquier proceso Node.js en ejecución
			{
				type = "pwa-node",
				request = "attach",
				name = "Attach JS Process",
				processId = require("dap.utils").pick_process,
				cwd = "${workspaceFolder}",
			},

			-- 🔥 Attach a Node con inspect (ej: NestJS en JS, Express, etc.)
			{
				name = "Attach Node (9229)",
				type = "pwa-node",
				request = "attach",
				port = 9229,
				cwd = "${workspaceFolder}",
				protocol = "inspector",
			},
		}

		-- 4. Configuración de la Interfaz Visual (DAP UI)
		dapui.setup()

		-- 5. Mapeos de Teclas (Keymaps)
		-- Usamos <leader>d (dap) como prefijo

		-- Operaciones de Depuración
		map("n", "<leader>dr", dap.continue, { desc = "DAP: Run/Continue" })
		map("n", "<leader>dn", dap.step_over, { desc = "DAP: Step Over" })
		map("n", "<leader>di", dap.step_into, { desc = "DAP: Step Into" })
		map("n", "<leader>do", dap.step_out, { desc = "DAP: Step Out" })
		map("n", "<leader>dc", dap.close, { desc = "DAP: Close Session" })
		map("n", "<leader>dt", dap.terminate, { desc = "DAP: Terminate Process" })
		map("n", "<leader>ds", dap.stop, { desc = "DAP: Stop" })
		map("n", "<leader>dR", dap.restart, { desc = "DAP: Restart" })

		-- Breakpoints
		map("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP: Toggle Breakpoint" })
		map("n", "<leader>dB", function()
			dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end, { desc = "DAP: Conditional Breakpoint" })

		-- Interfaz DAP UI
		map("n", "<leader>du", dapui.toggle, { desc = "DAP: Toggle DAP UI" })

		-- Conexión de DAP a DAP UI para mostrar la interfaz al iniciar/ocultar al finalizar
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end
	end,
}
