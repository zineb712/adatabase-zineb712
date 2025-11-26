DROP TABLE IF EXISTS resources_skills CASCADE;
DROP TABLE IF EXISTS resources CASCADE;
DROP TABLE IF EXISTS skills CASCADE;
DROP TABLE IF EXISTS themes CASCADE;

-- Supprimer le type enum
DROP TYPE IF EXISTS resource_type;

-- Supprimer le type enum
SET session_replication_role=DEFAULT;