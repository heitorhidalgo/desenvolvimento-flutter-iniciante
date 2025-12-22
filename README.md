# 👥 Gestão de Pessoas - Flutter App

Aplicativo completo de gerenciamento de usuários (CRUD) desenvolvido em Flutter, focado em **Clean Code**, **Arquitetura Limpa** e boas práticas de desenvolvimento.

O projeto demonstra o uso de **Gerenciamento de Estado Nativo** e **Injeção de Dependências** para criar uma aplicação robusta, escalável e com visual moderno (Material 3).

## 📱 Funcionalidades

-   **Listagem de Pessoas:** Visualização limpa com tratamento de carregamento (Loading) e lista vazia.
-   **Cadastro e Edição:** Formulários validados para criação e atualização de dados.
-   **Remoção Intuitiva:** Funcionalidade *Swipe-to-delete* (arrastar para excluir) com confirmação.
-   **Temas (Dark/Light):** Alternância de tema com persistência local (o app lembra sua escolha).
-   **Feedback Visual:** Snackbars para sucessos e erros, e indicadores de progresso.
-   **Pull-to-Refresh:** Atualização da lista ao puxar a tela para baixo.

## 🛠️ Tecnologias e Arquitetura

O projeto foi construído utilizando as seguintes tecnologias e padrões:

-   **Linguagem:** [Dart](https://dart.dev/)
-   **Framework:** [Flutter](https://flutter.dev/)
-   **Gerenciamento de Estado:** Nativo (`ChangeNotifier`, `ValueNotifier`, `ListenableBuilder`). Sem pacotes pesados de terceiros.
-   **Injeção de Dependência:** [get_it](https://pub.dev/packages/get_it) (Service Locator).
-   **Requisições HTTP:** [dio](https://pub.dev/packages/dio) com tratamento robusto de erros e timeouts.
-   **Persistência Local:** [shared_preferences](https://pub.dev/packages/shared_preferences) (para salvar o tema).
-   **Backend Simulado:** [JSON Server](https://github.com/typicode/json-server) (API REST mock).

### 📂 Estrutura do Projeto

A estrutura de pastas foi organizada para separar responsabilidades:

```text
lib/
├── controllers/    # Lógica de negócio e estado
├── dependencies/   # Configuração de Injeção de Dependência
├── models/         # Modelos de dados e DTOs (Data Transfer Objects)
├── pages/          # Telas do aplicativo
├── routes/         # Configuração de rotas nomeadas
├── services/       # Comunicação com API (ApiClient)
├── states/         # Estados selados (Sealed Classes) para mensagens
├── themes/         # Configuração de temas (Light/Dark)
└── widgets/        # Componentes visuais reutilizáveis
```
## 🚀 Como Rodar o Projeto

### Pré-requisitos
* Ter o [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado.
* Ter o [Node.js](https://nodejs.org/) instalado (para rodar o servidor simulado).

### Passo 1: Clonar e Instalar Dependências

```bash
git clone https://github.com/heitorhidalgo/desenvolvimento-flutter-iniciante
cd desenvolvimento_flutter_iniciante
flutter pub get
```

### Passo 2: Iniciar o Backend (API)

Este projeto usa um arquivo db.json local como banco de dados. Em um terminal separado, execute:

```bash
# Roda o servidor na porta 3000 e libera acesso externo (necessário para testes em dispositivos físicos)
npx json-server --watch db.json --port 3000 --host 0.0.0.0
```
Nota: Mantenha este terminal aberto enquanto usa o aplicativo.

### Passo 3: Rodar o Aplicativo

Em outro terminal, execute o projeto Flutter:

```bash
flutter run
```
O aplicativo está configurado para detectar automaticamente o ambiente:

* Android Emulator: Conecta via 10.0.2.2.

* iOS / Web: Conecta via localhost.

## 🎓 Sobre o Projeto

Este aplicativo foi desenvolvido como parte de um curso de Flutter na plataforma Udemy, ministrado pelo professor Paulo Antonio Mendes.

O objetivo do projeto foi aplicar na prática conceitos fundamentais como consumo de API REST, gerenciamento de estado, rotas nomeadas e organização de código.
