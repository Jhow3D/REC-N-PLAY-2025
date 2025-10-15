# Oficina: Gestão e Análise de Dados com IA e Python

Este projeto demonstra como usar **LangChain** + **LLM** para gerar um relatório financeiro a partir de um banco SQLite.

## Estrutura
```
langchain_sql_workshop/
  data/
    finance.db
  reports/
  app.py
  report_prompt.md
  seed_db.sql
  requirements.txt
  .env.example
  README.md
```

## Como rodar
1) Crie um ambiente e instale dependências:
```bash
pip install -r requirements.txt
```
2) Configure sua chave:
```bash
cp .env.example .env
# edite .env e cole sua OPENAI_API_KEY
```
3) Execute:
```bash
python app.py
```
O relatório em Markdown será criado em `reports/`.

## Observações
- Caso `create_sql_agent(..., agent_type="openai-tools")` não funcione na sua versão, troque para `agent_type="zero-shot-react-description"`.
- Você pode modificar o `report_prompt.md` para ajustar o escopo do relatório.


## Usando Grok (xAI) como provedor de LLM

1) Instale a integração do xAI:
```bash
pip install -r requirements.txt
```
> O `requirements.txt` já inclui `langchain-xai`.

2) Configure a chave da xAI:
```bash
cp .env.example .env
# edite .env e coloque sua XAI_API_KEY
```

3) Rode normalmente:
```bash
python app.py
```

O agente SQL agora utiliza `ChatXAI(model="grok-4")`. 
Se necessário, você pode trocar o nome do modelo (ex.: `grok-3`) e/ou remover `agent_type="tool-calling"` caso sua versão do LangChain trate isso automaticamente.


## Usando Groq (Llama) como provedor de LLM

1) Instale dependências (inclui `langchain-groq`):
```bash
pip install -r requirements.txt
```
2) Configure a chave da Groq:
```bash
cp .env.example .env
# edite .env e defina GROQ_API_KEY
```
3) Rode:
```bash
python app.py
```
O agente SQL usa `ChatGroq(model="llama-3.1-70b-versatile")`.
Se quiser mais velocidade/custo menor, troque para `llama-3.1-8b-instant` no `app.py`.
