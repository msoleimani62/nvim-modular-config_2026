# nvim-modular-config_2026

یک پیکربندی ماژولار، مینیمال و آماده تولید برای Neovim 0.12+ — بهینه‌شده برای توسعه Python، ابزارهای امنیتی و استفاده روزانه در ترمینال روی سخت‌افزار قدیمی و مدرن.

A modular, minimal, and production-ready Neovim configuration built for Neovim 0.12+ — optimized for Python development, security tooling, and daily terminal use on both modern and legacy hardware.

---

## ✨ ویژگی‌ها / Features

- **کاملاً ماژولار** — هر بخش در فایل مستقل خودش | **Fully modular** — each concern lives in its own file
- **بارگذاری تنبل** — پلاگین‌ها فقط وقتی لازمند لود می‌شوند | **Lazy loading** — plugins load only when needed
- **LSP آماده** — Python، Lua، Bash | **LSP out of the box** — Python (basedpyright), Lua (lua_ls), Bash (bashls)
- **فرمت‌بندی خودکار هنگام ذخیره** | **Auto-formatting on save** — black, stylua, shfmt
- **Linting** — flake8, shellcheck
- **رابط کاربری زیبا** — catppuccin، noice، bufferline، dashboard | **Beautiful UI** — catppuccin theme, noice cmdline, bufferline, dashboard
- **ناوبری سریع** — flash.nvim، telescope، nvim-tree | **Fast navigation** — flash.nvim, telescope, nvim-tree
- **یکپارچگی با Git** — gitsigns، diffview | **Git integration** — gitsigns, diffview
- **مناسب سخت‌افزار ضعیف** — تست‌شده روی ۲ گیگ رم و HDD | **Works on low-RAM machines** — tested on 2GB RAM with HDD

---

## 📁 ساختار فایل‌ها / Structure

```
~/.config/nvim/
├── init.lua                  ← بوت‌استرپ lazy.nvim + لود ماژول‌ها / Bootstrap + load modules
└── lua/
    ├── core.lua              ← تنظیمات، کلیدها، autocmds / Options, keymaps, autocmds
    └── plugins/
        ├── ui.lua            ← تم، statusline، bufferline، dashboard، noice
        ├── editor.lua        ← telescope، nvim-tree، flash، surround، gitsigns
        ├── lsp.lua           ← mason، lspconfig، nvim-cmp، fidget
        ├── tools.lua         ← formatter، linter، toggleterm
        └── extras.lua        ← treesitter، trouble، todo-comments
```

---

## ⚡ پیش‌نیازها / Requirements

| ابزار / Tool | دستور نصب روی Arch / Install on Arch |
|---|---|
| Neovim >= 0.12 | `sudo pacman -S neovim` |
| Git | `sudo pacman -S git` |
| GCC | `sudo pacman -S gcc` |
| Node.js | `sudo pacman -S nodejs npm` |
| Python 3 | `sudo pacman -S python python-pip` |
| unzip | `sudo pacman -S unzip` |
| ripgrep | `sudo pacman -S ripgrep` |
| Nerd Font (اختیاری / optional) | `yay -S ttf-jetbrains-mono-nerd` |

---

## 📦 نصب / Installation

### نصب تازه / Fresh install

```bash
# پشتیبان‌گیری از کانفیگ قبلی / Backup existing config
cp -r ~/.config/nvim ~/.config/nvim.bak

# کلون ریپو / Clone repository
git clone https://github.com/msoleimani62/nvim-modular-config_2026.git ~/.config/nvim

# باز کردن Neovim — lazy.nvim همه پلاگین‌ها را نصب می‌کند
# Open Neovim — lazy.nvim will auto-install all plugins
nvim
```

### جایگزینی کانفیگ موجود / Replace existing config

```bash
# پشتیبان‌گیری / Backup
cp -r ~/.config/nvim ~/.config/nvim.bak
rm -rf ~/.local/share/nvim/lazy

# کلون / Clone
git clone https://github.com/msoleimani62/nvim-modular-config_2026.git ~/.config/nvim

# باز کردن / Open
nvim
```

### نصب دستی از فایل zip / Manual install from zip

```bash
# استخراج / Extract
unzip nvim-config.zip
cp -r nvim-config/* ~/.config/nvim/

# پاک کردن کش lazy / Clear lazy cache
rm -rf ~/.local/share/nvim/lazy

# باز کردن / Open
nvim
```

---

## 🔧 بعد از نصب: ابزارهای Mason / Post-install: Mason tools

بعد از اولین اجرا، ابزارهای لازم را از Mason نصب کن:
After first launch, install required tools via Mason:

```
:Mason
```

| ابزار / Tool | کاربرد / Purpose |
|---|---|
| `basedpyright` | Python LSP |
| `lua-language-server` | Lua LSP |
| `bash-language-server` | Bash LSP |
| `black` | Python formatter |
| `stylua` | Lua formatter |
| `shfmt` | Shell formatter |
| `flake8` | Python linter |
| `shellcheck` | Shell linter |

---

## ⌨️ کلیدهای میانبر / Keymaps

> کلید Leader: `Space` / Leader key: `Space`

### فایل و بافر / File & Buffers

| کلید / Key | عملکرد / Action |
|---|---|
| `<leader>w` | ذخیره فایل / Save file |
| `<leader>q` | خروج / Quit |
| `<leader>Q` | خروج اجباری / Force quit all |
| `<leader>x` | بستن بافر / Close buffer |
| `<Tab>` | بافر بعدی / Next buffer |
| `<S-Tab>` | بافر قبلی / Previous buffer |

### ناوبری / Navigation

| کلید / Key | عملکرد / Action |
|---|---|
| `<leader>ff` | جستجوی فایل / Find files |
| `<leader>fg` | جستجوی متن / Live grep |
| `<leader>fb` | بافرهای باز / Open buffers |
| `<leader>fr` | فایل‌های اخیر / Recent files |
| `<leader>fh` | راهنما / Help tags |
| `<leader>t` | نمای درختی / File tree |
| `<leader>h` | پرش سریع / Flash jump forward |
| `<leader>l` | پرش معکوس / Flash jump backward |
| `<leader>c` | انتخاب treesitter / Flash treesitter |

### LSP

| کلید / Key | عملکرد / Action |
|---|---|
| `gd` | رفتن به تعریف / Go to definition |
| `gD` | رفتن به اعلان / Go to declaration |
| `gr` | ارجاعات / References |
| `gi` | پیاده‌سازی / Implementation |
| `K` | مستندات hover / Hover docs |
| `<leader>rn` | تغییر نام / Rename symbol |
| `<leader>ca` | عملیات کد / Code action |
| `<leader>ld` | خطاهای خط / Line diagnostics |
| `[d` / `]d` | خطای قبلی/بعدی / Prev/Next diagnostic |

### Git

| کلید / Key | عملکرد / Action |
|---|---|
| `<leader>gp` | پیش‌نمایش hunk / Preview hunk |
| `<leader>gb` | blame خط / Blame line |
| `<leader>gr` | برگرداندن hunk / Reset hunk |
| `<leader>gs` | stage کردن hunk / Stage hunk |
| `<leader>dv` | باز کردن diffview / Diffview open |
| `<leader>dh` | تاریخچه فایل / File history |
| `<leader>dc` | بستن diffview / Diffview close |

### ابزارها / Tools

| کلید / Key | عملکرد / Action |
|---|---|
| `<leader>f` | فرمت‌بندی فایل / Format file |
| `<C-\>` | باز/بستن ترمینال / Toggle terminal |
| `<leader>tf` | ترمینال شناور / Float terminal |
| `<leader>th` | ترمینال افقی / Horizontal terminal |
| `<leader>tv` | ترمینال عمودی / Vertical terminal |
| `<leader>xx` | لیست خطاها / Diagnostics (Trouble) |
| `<leader>xt` | لیست TODO / Todo list |
| `<leader>xr` | ارجاعات LSP / LSP references |
| `<leader>td` | TODO در Telescope / Todo in Telescope |

### ویرایش / Editing

| کلید / Key | عملکرد / Action |
|---|---|
| `<leader>y` | کپی به clipboard / Yank to clipboard |
| `<leader>p` | پیست از clipboard / Paste from clipboard |
| `<leader>d` | حذف بدون کپی / Delete no yank |
| `<leader>s` | جایگزینی کلمه / Replace word |
| `J` / `K` (visual) | انتقال خط / Move lines |
| `gcc` | کامنت خط / Toggle comment line |
| `gc` (visual) | کامنت انتخاب / Toggle comment selection |

### مدیریت پنجره / Window Management

| کلید / Key | عملکرد / Action |
|---|---|
| `<C-h/j/k/l>` | جابه‌جایی بین پنجره‌ها / Move between windows |
| `<C-Up/Down>` | تغییر اندازه افقی / Resize horizontally |
| `<C-Left/Right>` | تغییر اندازه عمودی / Resize vertically |

---

## 🎨 تم / Theme

تم پیش‌فرض **catppuccin mocha** با پس‌زمینه شفاف است.
Default theme is **catppuccin mocha** with transparent background.

برای تغییر، فایل `lua/plugins/ui.lua` را ویرایش کن:
To change, edit `lua/plugins/ui.lua`:

```lua
require("catppuccin").setup({
    flavour = "mocha",     -- mocha | macchiato | frappe | latte
    transparent_background = true,
})
```

---

## 🐍 توسعه Python / Python Development

این کانفیگ برای Python بهینه شده:
This config is optimized for Python:

- **basedpyright** — بررسی نوع و LSP / type checking and LSP
- **black** — فرمت‌بندی خودکار هنگام ذخیره / auto-format on save
- **flake8** — linting هنگام ذخیره / linting on save
- **Treesitter** — هایلایت syntax / syntax highlighting

قبل از باز کردن Neovim، محیط مجازی را فعال کن:
Activate your virtual environment before launching Neovim:

```bash
source .venv/bin/activate
nvim
```

---

## 🔒 امنیت و هکینگ / Security & Hacking

این کانفیگ با یک محیط Arch Linux امنیتی‌محور به خوبی کار می‌کند:
This config pairs well with a security-focused Arch Linux setup:

- ترمینال‌محور — بدون نیاز به GUI / Terminal-first — no GUI dependency
- کار در داخل tmux / Works inside tmux sessions
- SSH-friendly — همه keymapها از راه دور کار می‌کنند / All keymaps work over SSH
- toggleterm برای دسترسی سریع به shell / toggleterm for quick shell access

---

## 🛠 شخصی‌سازی / Customization

### اضافه کردن پلاگین جدید / Add a new plugin

فایل مناسب در `lua/plugins/` را ویرایش کن:
Edit the appropriate file in `lua/plugins/`:

```lua
{
    "author/plugin-name",
    event = "VeryLazy",
    config = function()
        require("plugin-name").setup({
            -- تنظیمات / your options
        })
    end,
},
```

### اضافه کردن LSP جدید / Add a new LSP server

فایل `lua/plugins/lsp.lua` را ویرایش کن:
Edit `lua/plugins/lsp.lua`:

```lua
vim.lsp.config("server_name", {
    -- تنظیمات / settings
})
vim.lsp.enable({ "basedpyright", "lua_ls", "bashls", "server_name" })
```

سپس از Mason نصب کن: `:Mason`
Then install via Mason: `:Mason`

---

## 📝 مجوز / License

MIT — آزادانه استفاده و تغییر بده / Use freely, modify as you wish.

---

## 🙏 تقدیر / Credits

ساخته‌شده با / Built with:
- [lazy.nvim](https://github.com/folke/lazy.nvim)
- [catppuccin](https://github.com/catppuccin/nvim)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [mason.nvim](https://github.com/williamboman/mason.nvim)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [folke's plugins](https://github.com/folke) — noice, which-key, trouble, flash, todo-comments

