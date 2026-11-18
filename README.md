# Config_nvimDoPC

Configuração pessoal do Neovim baseada no [LazyVim](https://www.lazyvim.org/), pensada para desenvolvimento backend e para manter um fluxo de trabalho parecido com o da IDE Zed.

O projeto prioriza navegação rápida por teclado, terminais integrados com abas visuais e uma base simples de manter e restaurar em outras máquinas.

## Destaques

- LazyVim como base da configuração.
- Tema [Nord](https://github.com/gbprod/nord.nvim).
- Explorador de arquivos com Snacks Explorer.
- Terminais integrados com abas visuais usando [tiny-term.nvim](https://github.com/jellydn/tiny-term.nvim).
- Atalhos inspirados no fluxo usado no Zed.
- Suporte configurado para C/C++, CMake, Java, Python, TypeScript, Tailwind CSS, Docker, SQL, Rust, PHP, JSON e Markdown.
- Telescope para pesquisa de arquivos e conteúdo.
- Prettier para formatação das tecnologias compatíveis.
- Live Server para desenvolvimento web.

## Pré-requisitos

- Neovim moderno — esta configuração é usada atualmente com a versão `0.12.6`.
- Git.
- Uma [Nerd Font](https://www.nerdfonts.com/) configurada no terminal.
- `ripgrep` e `fd` para pesquisas rápidas.
- Compilador C e ferramentas específicas das linguagens utilizadas no projeto.

Alguns servidores de linguagem, formatadores e depuradores são instalados pelo Mason na primeira utilização.

## Instalação

Se já existir uma configuração do Neovim, faça uma cópia de segurança antes de continuar:

```bash
mv ~/.config/nvim ~/.config/nvim.backup
mv ~/.local/share/nvim ~/.local/share/nvim.backup
mv ~/.local/state/nvim ~/.local/state/nvim.backup
mv ~/.cache/nvim ~/.cache/nvim.backup
```

Clone este repositório na pasta de configuração:

```bash
git clone https://github.com/PCnaoliga/Config_nvimDoPC.git ~/.config/nvim
nvim
```

Na primeira abertura, o `lazy.nvim` será instalado automaticamente e o LazyVim fará o download dos plugins. Aguarde o processo terminar e reinicie o Neovim se necessário.

Para acompanhar ou atualizar os plugins manualmente:

```vim
:Lazy
```

## Atalhos personalizados

`<leader>` representa a tecla de liderança configurada pelo LazyVim, normalmente `Espaço`.

### Interface e navegação

| Atalho | Ação |
| --- | --- |
| `Alt + Q` | Mostrar ou ocultar o explorador de arquivos |
| `Alt + E` | Mostrar ou ocultar o terminal |
| `Alt + Shift + E` | Criar uma nova aba de terminal |
| `Ctrl + ←` | Ir para a janela à esquerda |
| `Ctrl + →` | Ir para a janela à direita |
| `Ctrl + ↑` | Ir para a janela acima |
| `Ctrl + ↓` | Ir para a janela abaixo |
| `Ctrl + Shift + ←` | Ir para o buffer anterior |
| `Ctrl + Shift + →` | Ir para o próximo buffer |
| `Ctrl + Shift + Q` | Fechar o buffer atual |

### Terminais

Quando o foco estiver em um terminal do tiny-term:

| Atalho | Ação |
| --- | --- |
| `Ctrl + Shift + ←` | Ir para o terminal anterior |
| `Ctrl + Shift + →` | Ir para o próximo terminal |

As abas também podem ser selecionadas com o mouse na barra superior do painel de terminal.

### Edição e saída

| Atalho | Ação |
| --- | --- |
| `jj` | Sair do modo de inserção |
| `qq` | Fechar a janela atual ou sair do Neovim |
| `<leader>q` | Salvar e sair |
| `<leader>lt` | Ativar ou desativar o Live Server |

O atalho `qq` usa uma saída segura: se o arquivo tiver alterações não salvas, o Neovim impede o fechamento.

## Estrutura

```text
.
├── init.lua                  # Ponto de entrada
├── lazyvim.json              # Extras habilitados do LazyVim
├── lua
│   ├── config
│   │   ├── autocmds.lua      # Autocomandos personalizados
│   │   ├── keymaps.lua       # Atalhos personalizados
│   │   ├── lazy.lua          # Inicialização do lazy.nvim e do LazyVim
│   │   └── options.lua       # Opções do Neovim
│   └── plugins
│       ├── live-server.lua   # Servidor local para desenvolvimento web
│       ├── nord.lua          # Tema Nord
│       └── tiny-term.lua     # Terminais com abas visuais
└── stylua.toml               # Formatação dos arquivos Lua
```

## Tecnologias habilitadas

Os extras atuais do LazyVim incluem:

- C e C++ com clangd.
- CMake.
- Java.
- Python.
- TypeScript e JavaScript com vtsls.
- Tailwind CSS.
- Docker.
- SQL.
- Rust.
- PHP.
- JSON e Markdown.

## Próximos passos

- Adicionar suporte dedicado a Ruby e Ruby on Rails.
- Adicionar suporte dedicado a Vue.
- Integrar ferramentas de revisão e programação assistida por agentes sem duplicar as funções já disponíveis no Codex e no Antigravity.
- Expandir os atalhos apenas quando surgir uma necessidade real no fluxo de desenvolvimento.

## Licença

Este projeto está disponível sob a licença Apache 2.0. Consulte o arquivo [LICENSE](LICENSE).
