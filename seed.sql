-- Table themes
INSERT INTO themes (id, name) VALUES
(1, 'Frontend'),
(2, 'Backend'),
(3, 'Base de données'),
(4, 'DevOps');

-- Table skills
INSERT INTO skills (id, name) VALUES
(1, 'JavaScript'),
(2, 'React'),
(3, 'SQL'),
(4, 'PostgreSQL'),
(5, 'Node.js');

-- Table resources
INSERT INTO resources (id, title, url, description, type, is_ada, theme_id, updated_at) VALUES
(1, 'Introduction à React', 'https://react.dev', 'Guide officiel React', 'guide', false, 1, NOW() - INTERVAL '2 days'),
(2, 'SQL pour débutants', 'https://example.com/sql', 'Cours SQL complet', 'video', false, 3, NOW() - INTERVAL '3 days'),
(3, 'Exercices JavaScript', 'https://example.com/js', 'Pratique JS', 'exercice', false, 1, NOW() - INTERVAL '1 day'),
(4, 'Créer une API en Node', 'https://example.com/node', 'Projet Node', 'projet', false, 2, NOW() - INTERVAL '5 days'),
(5, 'Ada — Accessibilité web', 'https://ada.example.com', 'Guide accessibilité ADA', 'guide', true, 1, NOW() - INTERVAL '1 day');

-- Table resources_skills
INSERT INTO resources_skills (resource_id, skill_id) VALUES
(1,1),
(1,2),
(2,3),
(2,4),
(3,1),
(4,1),
(4,5),
(5,2);
