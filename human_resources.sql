-- Criar o banco de dados
CREATE DATABASE HumanResources;
USE HumanResources;

-- Tabela de Funcionários
CREATE TABLE Employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department VARCHAR(50),
    position VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE,
    status ENUM('Active', 'On Leave', 'Resigned', 'Terminated') DEFAULT 'Active'
);

-- Tabela de Promoções e Aumentos Salariais
CREATE TABLE SalaryHistory (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    old_salary DECIMAL(10,2),
    new_salary DECIMAL(10,2),
    promotion_date DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

-- Tabela de Avaliações de Desempenho
CREATE TABLE PerformanceReviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    review_date DATE DEFAULT CURRENT_DATE,
    performance_score INT CHECK (performance_score BETWEEN 1 AND 10),
    feedback TEXT,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

-- Tabela de Benefícios Corporativos
CREATE TABLE EmployeeBenefits (
    benefit_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    benefit_type VARCHAR(50),
    description TEXT,
    start_date DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

-- Inserindo Dados Fictícios
INSERT INTO Employees (first_name, last_name, department, position, salary, hire_date)
VALUES 
('Carlos', 'Santos', 'TI', 'Desenvolvedor', 5000.00, '2021-05-15'),
('Mariana', 'Alves', 'RH', 'Gerente de RH', 7500.00, '2019-08-10'),
('Felipe', 'Silva', 'Financeiro', 'Analista Financeiro', 6000.00, '2020-11-20');

-- Promoções e Aumentos Salariais
INSERT INTO SalaryHistory (employee_id, old_salary, new_salary)
VALUES 
(1, 5000.00, 5500.00),
(2, 7500.00, 8000.00);

-- Avaliações de Desempenho
INSERT INTO PerformanceReviews (employee_id, performance_score, feedback)
VALUES 
(1, 9, 'Excelente trabalho no último trimestre.'),
(2, 7, 'Bom desempenho, mas precisa melhorar a comunicação.');

-- Benefícios Corporativos
INSERT INTO EmployeeBenefits (employee_id, benefit_type, description)
VALUES 
(1, 'Plano de Saúde', 'Plano de saúde premium para o funcionário e dependentes.'),
(2, 'Vale Alimentação', 'R$ 600,00 de vale alimentação por mês.');
