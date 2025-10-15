import os
from pathlib import Path
from dotenv import load_dotenv
from langchain_community.utilities import SQLDatabase
from langchain_community.agent_toolkits import SQLDatabaseToolkit
from langchain_groq import ChatGroq
from langchain.agents import create_sql_agent
from datetime import datetime

BASE_DIR = Path(__file__).resolve().parent
DATA_DIR = BASE_DIR / "data"
REPORTS_DIR = BASE_DIR / "reports"
PROMPT_PATH = BASE_DIR / "report_prompt.md"

def load_env():
    load_dotenv(BASE_DIR / ".env", override=False)
    
def build_agent():
    db_uri = f"sqlite:///{(DATA_DIR / 'finance.db').as_posix()}"
    db = SQLDatabase.from_uri(db_uri)
    llm = ChatGroq(model="llama-3.1-8b-instant", temperature=0)  # ajuste o modelo se preferir
    toolkit = SQLDatabaseToolkit(db=db, llm=llm)
    # Para versões mais novas do LangChain, agent_type="tool-calling" usa tool calling da OpenAI.
    agent = create_sql_agent(
        llm=llm,
        toolkit=toolkit,
        verbose=True,
        agent_type="tool-calling",
        top_k=5
    )
    return agent

def main():
    load_env()
    REPORTS_DIR.mkdir(exist_ok=True)
    prompt = PROMPT_PATH.read_text(encoding="utf-8")
    agent = build_agent()
    print("🚀 Gerando relatório... (isso pode levar alguns segundos)")
    result = agent.run(prompt)
    ts = datetime.now().strftime("%Y%m%d_%H%M%S")
    out_path = REPORTS_DIR / f"financial_report_{ts}.md"
    out_path.write_text(result, encoding="utf-8")
    print(f"✅ Relatório salvo em: {out_path}")

if __name__ == "__main__":
    main()
