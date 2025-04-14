-- Banco de Dados: Sistema de Gestão de Colaboradores
CREATE DATABASE gestao_colaboradores;

\c gestao_colaboradores;

-- Tabela de Colaboradores
CREATE TABLE colaboradores (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    data_admissao DATE NOT NULL
);

-- Tabela de Documentos
CREATE TABLE documentos (
    id SERIAL PRIMARY KEY,
    colaborador_id INTEGER REFERENCES colaboradores(id) ON DELETE CASCADE,
    tipo VARCHAR(50) NOT NULL,
    descricao TEXT,
    data_emissao DATE NOT NULL,
    data_vencimento DATE NOT NULL
);

-- Tabela de Treinamentos
CREATE TABLE treinamentos (
    id SERIAL PRIMARY KEY,
    colaborador_id INTEGER REFERENCES colaboradores(id) ON DELETE CASCADE,
    nome_treinamento VARCHAR(100) NOT NULL,
    data_realizacao DATE NOT NULL,
    status VARCHAR(20) CHECK (status IN ('Concluído', 'Pendente')) NOT NULL
);

-- Tabela de Exames e Certificações
CREATE TABLE exames_certificacoes (
    id SERIAL PRIMARY KEY,
    colaborador_id INTEGER REFERENCES colaboradores(id) ON DELETE CASCADE,
    tipo VARCHAR(100) NOT NULL,
    data_realizacao DATE NOT NULL,
    data_vencimento DATE NOT NULL
);

-- Tabela de EPIs
CREATE TABLE epis (
    id SERIAL PRIMARY KEY,
    colaborador_id INTEGER REFERENCES colaboradores(id) ON DELETE CASCADE,
    nome_epi VARCHAR(100) NOT NULL,
    data_entrega DATE NOT NULL,
    validade DATE NOT NULL
);

-- View para Relatório de Documentos Próxim

