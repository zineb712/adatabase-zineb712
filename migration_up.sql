-- Création de l'enum pour le type de ressource
CREATE TYPE resource_type AS ENUM ('guide', 'video', 'exercice', 'projet');

-- Table themes
CREATE TABLE themes (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Table resources
CREATE TABLE resources (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    url TEXT NOT NULL,
    description TEXT,
    type resource_type NOT NULL,
    is_ada BOOLEAN DEFAULT false,
    theme_id INTEGER,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (theme_id) REFERENCES themes(id)
);

-- Table skills
CREATE TABLE skills (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Table de liaison resources_skills
CREATE TABLE resources_skills (
    resource_id INTEGER,
    skill_id INTEGER,
    PRIMARY KEY (resource_id, skill_id),
    FOREIGN KEY (resource_id) REFERENCES resources(id) ON DELETE CASCADE,
    FOREIGN KEY (skill_id) REFERENCES skills(id) ON DELETE CASCADE
);
