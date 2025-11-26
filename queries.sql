-- 1) Récupérer la liste des thèmes
SELECT themes.id, themes.name
FROM themes
ORDER BY themes.name;

-- 2) Récupérer toutes les ressources triées par date de mise à jour
SELECT 
    resources.id, 
    resources.title, 
    resources.url, 
    resources.description, 
    resources.type, 
    resources.is_ada, 
    themes.name AS theme, 
    resources.updated_at
FROM resources
LEFT JOIN themes ON resources.theme_id = themes.id
ORDER BY resources.updated_at DESC;

-- 3) Récupérer uniquement le nom et l'url des ressources de type exercice
SELECT resources.title, resources.url
FROM resources
WHERE resources.type = 'exercice';

-- 4) Récupérer le titre et la description des ressources d'Ada uniquement
SELECT resources.title, resources.description
FROM resources
WHERE resources.is_ada = TRUE;

-- 5) Récupérer les ressources qui ont la compétence JavaScript associée
SELECT resources.id, resources.title, resources.url
FROM resources
JOIN resources_skills ON resources.id = resources_skills.resource_id
JOIN skills ON resources_skills.skill_id = skills.id
WHERE skills.name = 'JavaScript';

-- 6) Récupérer les ressources dont le titre contient le mot "react" (insensible à la casse)
SELECT resources.id, resources.title, resources.url
FROM resources
WHERE resources.title ILIKE '%react%';

-- Bonus 1: Liste des thèmes avec le nombre de ressources par thème
SELECT themes.id, themes.name, COUNT(resources.id) AS resources_count
FROM themes
LEFT JOIN resources ON resources.theme_id = themes.id
GROUP BY themes.id, themes.name
ORDER BY resources_count DESC;

-- Bonus 2: Nom et url de toutes les ressources avec la liste des skills associés
SELECT resources.id, resources.title, resources.url, COALESCE(array_agg(skills.name ORDER BY skills.name) FILTER (WHERE skills.name IS NOT NULL), ARRAY[]::text[]) AS skills
FROM resources
LEFT JOIN resources_skills ON resources.id = resources_skills.resource_id
LEFT JOIN skills ON resources_skills.skill_id = skills.id
GROUP BY resources.id, resources.title, resources.url
ORDER BY resources.updated_at DESC;

-- Bonus 3: 5 ressources les plus récentes avec leur thème
SELECT resources.id, resources.title, resources.updated_at, themes.name AS theme
FROM resources
LEFT JOIN themes ON resources.theme_id = themes.id
ORDER BY resources.updated_at DESC
LIMIT 5;

-- Bonus 4: Compétences qui ne sont associées à aucune ressource
SELECT skills.id, skills.name
FROM skills
LEFT JOIN resources_skills ON skills.id = resources_skills.skill_id
WHERE resources_skills.skill_id IS NULL;
