CREATE TABLE `audit` (
	`id` text PRIMARY KEY NOT NULL,
	`actor` text NOT NULL,
	`action` text NOT NULL,
	`target` text NOT NULL,
	`created` text NOT NULL
);
--> statement-breakpoint
CREATE TABLE `claims` (
	`id` text PRIMARY KEY NOT NULL,
	`report_id` text NOT NULL,
	`owner` text NOT NULL,
	`name` text NOT NULL,
	`details` text NOT NULL,
	`evidence` text,
	`state` text DEFAULT 'pending' NOT NULL,
	`created` text NOT NULL,
	FOREIGN KEY (`report_id`) REFERENCES `reports`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE INDEX `claim_report` ON `claims` (`report_id`);--> statement-breakpoint
CREATE TABLE `limits` (
	`key` text PRIMARY KEY NOT NULL,
	`count` integer DEFAULT 0 NOT NULL
);
--> statement-breakpoint
CREATE TABLE `members` (
	`id` text PRIMARY KEY NOT NULL,
	`name` text NOT NULL,
	`email` text NOT NULL,
	`institute` text NOT NULL,
	`department` text DEFAULT '' NOT NULL,
	`enrollment` text DEFAULT '' NOT NULL,
	`verification` text DEFAULT 'pending' NOT NULL,
	`role` text DEFAULT 'member' NOT NULL,
	`evidence` text,
	`created` text NOT NULL
);
--> statement-breakpoint
CREATE TABLE `messages` (
	`id` text PRIMARY KEY NOT NULL,
	`claim_id` text NOT NULL,
	`sender` text NOT NULL,
	`body` text NOT NULL,
	`created` text NOT NULL,
	FOREIGN KEY (`claim_id`) REFERENCES `claims`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE INDEX `message_claim` ON `messages` (`claim_id`,`created`);--> statement-breakpoint
CREATE TABLE `reports` (
	`id` text PRIMARY KEY NOT NULL,
	`owner` text NOT NULL,
	`kind` text NOT NULL,
	`title` text NOT NULL,
	`category` text NOT NULL,
	`description` text NOT NULL,
	`location` text NOT NULL,
	`date` text NOT NULL,
	`institute` text NOT NULL,
	`name` text NOT NULL,
	`department` text DEFAULT '' NOT NULL,
	`private_details` text DEFAULT '' NOT NULL,
	`custody` text DEFAULT 'holding' NOT NULL,
	`office` text DEFAULT '' NOT NULL,
	`photo` text,
	`evidence` text,
	`moderation` text DEFAULT 'pending' NOT NULL,
	`status` text DEFAULT 'open' NOT NULL,
	`reason` text DEFAULT '' NOT NULL,
	`created` text NOT NULL,
	`resolved` text
);
--> statement-breakpoint
CREATE INDEX `report_browse` ON `reports` (`moderation`,`status`,`created`);--> statement-breakpoint
CREATE INDEX `report_owner` ON `reports` (`owner`);--> statement-breakpoint
CREATE TABLE `settings` (
	`key` text PRIMARY KEY NOT NULL,
	`value` text NOT NULL
);
