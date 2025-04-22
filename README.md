# 🧰 Projeto: `rundev`

Simplifique o processo de startar seus projetos com comandos personalizados utilizando um simples comando no terminal como:

```bash
rundev tdw
```

## 🚀 Passo a passo para rodar o projeto

### 1. 🔽 Clonar o repositório

```bash
git clone https://github.com/seu-usuario/rundev.git
cd rundev
```

### 2. ✅ Dar permissão de execução aos scripts

Antes de executar, dê permissão aos scripts:

```bash
chmod +x setup-rundev.sh run-project.sh ignite.sh clear-rundev.sh
```

### 3. 🧩 Configurar os scripts de cada projeto

Você só precisa configurar os aliases no arquivo projects.txt.
Esse arquivo segue o seguinte formato:

```bash
# alias_name=valor
# target_dir_name=valor
# commands=valor
```

Onde:

alias_name é o nome do comando que será usado no terminal.

target_dir_name é o nome da pasta do projeto que será buscada.

commands são os comandos que serão executados no diretório do projeto para starta-lo.

Exemplo:

```bash
# alias_name=tdw
# target_dir_name=to-do-web
# commands=git branch; yarn; yarn dev
```

#### Tanto os projetos que vc irão rodar, quanto esse projeto, devem estar no diretorio Documentos ou Documents!

### 4. ⚙️ Registrar os comandos personalizados

```bash
./setup-rundev.sh
```

Isso criará comandos como:

```bash
rundev tdw
```

### 5. 🧪 Recarregar o terminal

Para ativar os comandos rundev, reinicie o terminal ou rode:

```bash
source ~/.bashrc
# ou
source ~/.zshrc
```

### 6. Rodar o projeto

Agora você pode rodar seus projetos com apenas:

```bash
rundev to-do
```

### 7. ⚠️ Remover alias e funções

```bash
/.clear-rundev.sh
```

## 🗂 Estrutura sugerida de diretórios

```bash
~/Documentos/git/run-projects/
├── clear-rundev.sh
├── run-todo.sh
├── run-project.sh
├── ignite.sh
└── setup-rundev.sh
```

## 📜 Licença

Este projeto está licenciado sob a Licença MIT.
Sinta-se à vontade para usar, modificar e compartilhar. 😄
