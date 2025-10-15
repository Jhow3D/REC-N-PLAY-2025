
PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS accounts;
DROP TABLE IF EXISTS transactions;

CREATE TABLE accounts (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  type TEXT NOT NULL -- 'bank', 'credit', 'cash'
);

CREATE TABLE transactions (
  id INTEGER PRIMARY KEY,
  date TEXT NOT NULL,         -- ISO date YYYY-MM-DD
  type TEXT NOT NULL,         -- 'REVENUE' or 'EXPENSE'
  category TEXT NOT NULL,
  description TEXT,
  amount REAL NOT NULL,       -- positive values only
  account_id INTEGER NOT NULL REFERENCES accounts(id)
);

INSERT INTO accounts (id, name, type) VALUES
  (1, 'Banco Principal', 'bank'),
  (2, 'Cartão Corporativo', 'credit'),
  (3, 'Caixa', 'cash');

-- Sample data for 2024 (12 months) with a mix of revenue and expenses
INSERT INTO transactions (date, type, category, description, amount, account_id) VALUES
  ('2024-01-05','REVENUE','Vendas','Contrato A - Janeiro', 52000.00,1),
  ('2024-01-10','EXPENSE','Folha','Salários Janeiro', 28000.00,1),
  ('2024-01-12','EXPENSE','Marketing','Anúncios', 3000.00,2),
  ('2024-01-20','EXPENSE','Operacional','Aluguel', 6000.00,1),
  ('2024-01-25','EXPENSE','Impostos','DARF', 2500.00,1),
  ('2024-02-03','REVENUE','Vendas','Contrato B - Fevereiro', 61000.00,1),
  ('2024-02-10','EXPENSE','Folha','Salários Fevereiro', 28500.00,1),
  ('2024-02-14','EXPENSE','Marketing','Eventos', 4500.00,2),
  ('2024-02-20','EXPENSE','Operacional','Aluguel', 6000.00,1),
  ('2024-02-26','EXPENSE','Impostos','DARF', 2700.00,1),
  ('2024-03-04','REVENUE','Vendas','Contrato C - Março', 58000.00,1),
  ('2024-03-10','EXPENSE','Folha','Salários Março', 29000.00,1),
  ('2024-03-16','EXPENSE','Operacional','Energia', 1800.00,1),
  ('2024-03-20','EXPENSE','Operacional','Aluguel', 6000.00,1),
  ('2024-03-22','EXPENSE','Marketing','Anúncios', 3800.00,2),
  ('2024-04-05','REVENUE','Vendas','Contrato A - Abril', 64000.00,1),
  ('2024-04-10','EXPENSE','Folha','Salários Abril', 29500.00,1),
  ('2024-04-18','EXPENSE','Operacional','Aluguel', 6000.00,1),
  ('2024-04-22','EXPENSE','Impostos','DARF', 3000.00,1),
  ('2024-04-25','EXPENSE','Marketing','Influenciadores', 5000.00,2),
  ('2024-05-03','REVENUE','Vendas','Projeto Especial Maio', 72000.00,1),
  ('2024-05-10','EXPENSE','Folha','Salários Maio', 30000.00,1),
  ('2024-05-15','EXPENSE','Operacional','Aluguel', 6000.00,1),
  ('2024-05-17','EXPENSE','Operacional','SaaS/Softwares', 2200.00,2),
  ('2024-05-27','EXPENSE','Impostos','DARF', 3100.00,1),
  ('2024-06-06','REVENUE','Vendas','Contrato B - Junho', 56000.00,1),
  ('2024-06-10','EXPENSE','Folha','Salários Junho', 30200.00,1),
  ('2024-06-13','EXPENSE','Operacional','Aluguel', 6000.00,1),
  ('2024-06-20','EXPENSE','Marketing','Anúncios', 3500.00,2),
  ('2024-06-25','EXPENSE','Impostos','DARF', 2900.00,1),
  ('2024-07-04','REVENUE','Vendas','Contrato D - Julho', 60000.00,1),
  ('2024-07-10','EXPENSE','Folha','Salários Julho', 30500.00,1),
  ('2024-07-15','EXPENSE','Operacional','Aluguel', 6000.00,1),
  ('2024-07-18','EXPENSE','Operacional','Energia', 1900.00,1),
  ('2024-07-25','EXPENSE','Marketing','Eventos', 4800.00,2),
  ('2024-08-05','REVENUE','Vendas','Contrato E - Agosto', 67500.00,1),
  ('2024-08-10','EXPENSE','Folha','Salários Agosto', 30800.00,1),
  ('2024-08-16','EXPENSE','Operacional','Aluguel', 6000.00,1),
  ('2024-08-21','EXPENSE','Operacional','SaaS/Softwares', 2300.00,2),
  ('2024-08-27','EXPENSE','Impostos','DARF', 3200.00,1),
  ('2024-09-03','REVENUE','Vendas','Contrato F - Setembro', 59000.00,1),
  ('2024-09-10','EXPENSE','Folha','Salários Setembro', 31000.00,1),
  ('2024-09-13','EXPENSE','Operacional','Aluguel', 6000.00,1),
  ('2024-09-20','EXPENSE','Marketing','Anúncios', 3600.00,2),
  ('2024-09-25','EXPENSE','Impostos','DARF', 3000.00,1),
  ('2024-10-04','REVENUE','Vendas','Contrato G - Outubro', 70500.00,1),
  ('2024-10-10','EXPENSE','Folha','Salários Outubro', 31200.00,1),
  ('2024-10-15','EXPENSE','Operacional','Aluguel', 6000.00,1),
  ('2024-10-22','EXPENSE','Marketing','Influenciadores', 5200.00,2),
  ('2024-10-28','EXPENSE','Impostos','DARF', 3300.00,1),
  ('2024-11-05','REVENUE','Vendas','Contrato H - Novembro', 68500.00,1),
  ('2024-11-10','EXPENSE','Folha','Salários Novembro', 31500.00,1),
  ('2024-11-14','EXPENSE','Operacional','Aluguel', 6000.00,1),
  ('2024-11-19','EXPENSE','Operacional','Energia', 2000.00,1),
  ('2024-11-26','EXPENSE','Impostos','DARF', 3400.00,1),
  ('2024-12-03','REVENUE','Vendas','Contrato I - Dezembro', 75000.00,1),
  ('2024-12-10','EXPENSE','Folha','Salários Dezembro', 31800.00,1),
  ('2024-12-13','EXPENSE','Operacional','Aluguel', 6000.00,1),
  ('2024-12-18','EXPENSE','Operacional','SaaS/Softwares', 2400.00,2),
  ('2024-12-23','EXPENSE','Marketing','Anúncios', 4000.00,2),
  ('2024-12-27','EXPENSE','Impostos','DARF', 3600.00,1);
