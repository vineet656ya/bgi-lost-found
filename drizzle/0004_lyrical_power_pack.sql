ALTER TABLE `members` ADD `account_type` text DEFAULT 'student' NOT NULL;--> statement-breakpoint
ALTER TABLE `members` ADD `designation` text DEFAULT '' NOT NULL;