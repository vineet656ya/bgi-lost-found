CREATE TABLE `account_sessions` (
	`hash` text PRIMARY KEY NOT NULL,
	`member_id` text NOT NULL,
	`expires` integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE `credentials` (
	`username` text PRIMARY KEY NOT NULL,
	`member_id` text NOT NULL,
	`password_hash` text NOT NULL,
	`salt` text NOT NULL,
	`recovery_hash` text NOT NULL
);
--> statement-breakpoint
CREATE INDEX `credential_member` ON `credentials` (`member_id`);--> statement-breakpoint
CREATE TABLE `deletion_queue` (
	`id` text PRIMARY KEY NOT NULL,
	`keys` text NOT NULL,
	`created` text NOT NULL
);
--> statement-breakpoint
ALTER TABLE `members` ADD `class_name` text DEFAULT '' NOT NULL;--> statement-breakpoint
ALTER TABLE `members` ADD `section` text DEFAULT '' NOT NULL;--> statement-breakpoint
ALTER TABLE `members` ADD `graduation_date` text;