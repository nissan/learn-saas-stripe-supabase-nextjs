BEGIN;
SELECT plan(1);

-- BEGIN;

-- Load the pgTAP library
-- \i /path/to/pgtap.sql

-- Ensure that the table exists
SELECT has_table('public', 'lesson');

-- Check the columns exist
SELECT has_column('public', 'lesson', 'id');
SELECT has_column('public', 'lesson', 'created_at');
SELECT has_column('public', 'lesson', 'title');
SELECT has_column('public', 'lesson', 'description');

-- Check column defaults
SELECT has_column_default('public', 'lesson', 'created_at', 'now()');
SELECT hasnt_column_default('public', 'lesson', 'id');
SELECT hasnt_column_default('public', 'lesson', 'title');
SELECT hasnt_column_default('public', 'lesson', 'description');

-- Check column types
SELECT col_is_pk('public', 'lesson', 'id', 'id is a primary key');
SELECT col_type_is('public', 'lesson', 'id', 'bigint', 'id is bigint');
SELECT col_type_is('public', 'lesson', 'created_at', 'timestamp with time zone', 'created_at is timestamp with time zone');
SELECT col_type_is('public', 'lesson', 'title', 'text', 'title is text');
SELECT col_type_is('public', 'lesson', 'description', 'text', 'description is text');

-- Check the primary key
SELECT has_pk('public', 'lesson', 'lesson_pkey');

-- Check the index
SELECT has_index('public', 'lesson', 'lesson_pkey');

-- Check for row level security
SELECT has_table_policy('public', 'lesson');

-- Finish the tests and clean up
SELECT * FROM finish();
ROLLBACK;