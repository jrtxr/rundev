# 🧰 Projeto: `rundev`

Automatize o processo de iniciar seus projetos com comandos personalizados usando um simples comando no terminal como:

```bash
rundev to-do
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
chmod +x setup-rundev.sh run-project.sh ignite.sh
```

### 3. ⚙️ Configurar variáveis nos arquivos

a) setup-rundev.sh
Edite este trecho no script e aponte para o local onde os esses scripts ficarão:

```bash
BASE_PATH=$HOME/Documentos/git/run-projects
```

b) run-project.sh
Configure as variáveis para o seu projeto:

```bash
TARGET_DIR_NAME="to-do"
BASE_PATH=~/Documentos/git
COMMANDS=("git branch" "yarn" "yarn dev")
```

### 4. 🧩 Criar scripts para vários projetos

Você pode duplicar e renomear o run-project.sh para cada projeto:

```bash
cp run-project.sh run-todo.sh
cp run-project.sh run-api.sh
```

Depois, configure o TARGET_DIR_NAME, BASE_PATH e COMMANDS em cada script com os valores específicos de cada projeto.

### 5. 🧷 Registrar os comandos personalizados

Para cada script criado, registre um alias com setup-rundev.sh:

```bash
./setup-rundev.sh run-todo.sh to-do
./setup-rundev.sh run-api.sh api
```

Isso criará comandos como:

```bash
rundev to-do
rundev api
```

### 6. 🧪 Recarregar o terminal

Para ativar os comandos rundev, reinicie o terminal ou rode:

```bash
source ~/.bashrc
# ou
source ~/.zshrc
```

### 6. 🧪 Recarregar o terminal

Agora você pode rodar seus projetos com apenas:

```bash
rundev to-do
```

## 🗂 Estrutura sugerida de diretórios

```bash
~/Documentos/git/run-projects/
├── run-todo.sh
├── run-api.sh
├── ignite.sh
└── setup-rundev.sh
```

## 📜 Licença

Este projeto está licenciado sob a Licença MIT.
Sinta-se à vontade para usar, modificar e compartilhar. 😄
