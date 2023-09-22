

CREATE TABLE transaction_detail (
	id varchar(255) NOT NULL, -- The UUID string
	admin_amount varchar(255) NULL, -- Admin Amount
	amount numeric(38,2) NULL, -- Request amount
	authorization_code varchar(255) NULL, -- Authorization Code
	auto_detect bool NOT NULL, -- Auto detect card number by mobile
	cancelurl varchar(255) NULL, -- Cancel URL
	card_holder_name varchar(255) NULL, -- Card holder name
	card_number varchar(255) NULL, -- Card number
	currency varchar(255) NULL, -- Currency
	custom_data varchar(255) NULL, -- Request custom data
	description varchar(255) NULL, -- Request description
	driveric varchar(255) NULL, -- Driver IC
	expiry_date varchar(255) NULL, -- Expiry date
	gst_amount varchar(255) NULL, -- GST Amount
	ip_address varchar(255) NULL, -- Source IP Address
	job_no varchar(255) NULL, -- Job Number
	merchant_account_id varchar(255) NULL, -- Merchant Account ID
	merchantid varchar(255) NULL, -- Merchant ID
	mobile varchar(255) NULL, -- Customer mobile number
	notificationurl varchar(255) NULL, -- Notification URL
	offline_indicator varchar(255) NULL, -- Offline Indicator (Y|N)
	order_number varchar(255) NULL, -- Order number
	pa_req varchar(255) NULL, -- Param request (UUID)
	profile_id varchar(255) NULL, -- Profile ID
	request_id varchar(255) NULL, -- Request ID
	request_timestamp varchar(255) NULL, -- Request timestamp
	response_code varchar(255) NULL, -- Response code
	response_message varchar(255) NULL, -- Response message
	ret_ref_no varchar(255) NULL, -- Return Ref Number
	returnurl varchar(255) NULL, -- Return URL
	signature varchar(255) NULL, -- Request signature
	sys_trace_no varchar(255) NULL, -- System Trace Number
	terminalid varchar(255) NULL, -- Terminal ID
	transaction_date_time timestamp NULL, -- Transaction timestamp
	transaction_type varchar(255) NULL, -- Transaction Type
	vehicle_no varchar(255) NULL, -- Vehicle Number
	amount_of_trans numeric(38,2) NULL, -- Amount of Transaction
	fare_amount numeric(38,2) NULL, -- Fare Amount
	offline_transaction_date_time timestamp NULL, -- Offline transaction timestamp
	trip_info varchar(255) NULL, -- Contactless Trip Info
	entry_mode varchar(255) NULL, -- Entry Mode
	nii varchar(255) NULL, -- Network International Identifier (NII)
	CONSTRAINT transaction_detail_pkey PRIMARY KEY (id),
	CONSTRAINT transaction_detail_transaction_type_check CHECK (((transaction_type)::text = ANY ((ARRAY['ADD_CARD'::character varying, 'PRE_AUTH'::character varying, 'PRE_AUTH_VOID'::character varying, 'SALES'::character varying, 'VOID_SALES'::character varying, 'REVERSAL'::character varying, 'SETTLEMENT'::character varying, 'SETTLEMENT_TRAILER'::character varying, 'BATCH_UPLOAD'::character varying, 'HEARTBEAT'::character varying, 'OFFLINE_SALES'::character varying, 'OFFLINE_VOID_SALES'::character varying])::text[])))
);

-- Column comments

COMMENT ON COLUMN transaction_detail.id IS 'The UUID string';
COMMENT ON COLUMN transaction_detail.admin_amount IS 'Admin Amount';
COMMENT ON COLUMN transaction_detail.amount IS 'Request amount';
COMMENT ON COLUMN transaction_detail.authorization_code IS 'Authorization Code';
COMMENT ON COLUMN transaction_detail.auto_detect IS 'Auto detect card number by mobile';
COMMENT ON COLUMN transaction_detail.cancelurl IS 'Cancel URL';
COMMENT ON COLUMN transaction_detail.card_holder_name IS 'Card holder name';
COMMENT ON COLUMN transaction_detail.card_number IS 'Card number';
COMMENT ON COLUMN transaction_detail.currency IS 'Currency';
COMMENT ON COLUMN transaction_detail.custom_data IS 'Request custom data';
COMMENT ON COLUMN transaction_detail.description IS 'Request description';
COMMENT ON COLUMN transaction_detail.driveric IS 'Driver IC';
COMMENT ON COLUMN transaction_detail.expiry_date IS 'Expiry date';
COMMENT ON COLUMN transaction_detail.gst_amount IS 'GST Amount';
COMMENT ON COLUMN transaction_detail.ip_address IS 'Source IP Address';
COMMENT ON COLUMN transaction_detail.job_no IS 'Job Number';
COMMENT ON COLUMN transaction_detail.merchant_account_id IS 'Merchant Account ID';
COMMENT ON COLUMN transaction_detail.merchantid IS 'Merchant ID';
COMMENT ON COLUMN transaction_detail.mobile IS 'Customer mobile number';
COMMENT ON COLUMN transaction_detail.notificationurl IS 'Notification URL';
COMMENT ON COLUMN transaction_detail.offline_indicator IS 'Offline Indicator (Y|N)';
COMMENT ON COLUMN transaction_detail.order_number IS 'Order number';
COMMENT ON COLUMN transaction_detail.pa_req IS 'Param request (UUID)';
COMMENT ON COLUMN transaction_detail.profile_id IS 'Profile ID';
COMMENT ON COLUMN transaction_detail.request_id IS 'Request ID';
COMMENT ON COLUMN transaction_detail.request_timestamp IS 'Request timestamp';
COMMENT ON COLUMN transaction_detail.response_code IS 'Response code';
COMMENT ON COLUMN transaction_detail.response_message IS 'Response message';
COMMENT ON COLUMN transaction_detail.ret_ref_no IS 'Return Ref Number';
COMMENT ON COLUMN transaction_detail.returnurl IS 'Return URL';
COMMENT ON COLUMN transaction_detail.signature IS 'Request signature';
COMMENT ON COLUMN transaction_detail.sys_trace_no IS 'System Trace Number';
COMMENT ON COLUMN transaction_detail.terminalid IS 'Terminal ID';
COMMENT ON COLUMN transaction_detail.transaction_date_time IS 'Transaction timestamp';
COMMENT ON COLUMN transaction_detail.transaction_type IS 'Transaction Type';
COMMENT ON COLUMN transaction_detail.vehicle_no IS 'Vehicle Number';
COMMENT ON COLUMN transaction_detail.amount_of_trans IS 'Amount of Transaction';
COMMENT ON COLUMN transaction_detail.fare_amount IS 'Fare Amount';
COMMENT ON COLUMN transaction_detail.offline_transaction_date_time IS 'Offline transaction timestamp';
COMMENT ON COLUMN transaction_detail.trip_info IS 'Contactless Trip Info';
COMMENT ON COLUMN transaction_detail.entry_mode IS 'Entry Mode';
COMMENT ON COLUMN transaction_detail.nii IS 'Network International Identifier (NII)';



CREATE TABLE card_token (
	id varchar(255) NOT NULL, -- The UUID
	created_at timestamp NULL, -- Create timestamp
	token_status varchar(255) NULL, -- Token status
	transaction_id varchar(255) NULL, -- Transaction UUID
	updated_at timestamp NULL, -- Update timestamp
	CONSTRAINT card_token_pkey PRIMARY KEY (id),
	CONSTRAINT card_token_token_status_check CHECK (((token_status)::text = ANY ((ARRAY['ACTIVE'::character varying, 'INACTIVE'::character varying, 'DELETED'::character varying])::text[])))
);

-- Column comments

COMMENT ON COLUMN card_token.id IS 'The UUID';
COMMENT ON COLUMN card_token.created_at IS 'Create timestamp';
COMMENT ON COLUMN card_token.token_status IS 'Token status';
COMMENT ON COLUMN card_token.transaction_id IS 'Transaction UUID';
COMMENT ON COLUMN card_token.updated_at IS 'Update timestamp';




CREATE TABLE merchant (
	id int8 NOT NULL, -- Record ID
	api_key varchar(255) NULL, -- Company API Key
	merchant_id varchar(255) NULL, -- Merchant ID
	public_key varchar(2048) NULL, -- RSA Public key
	CONSTRAINT merchant_pkey PRIMARY KEY (id)
);

-- Column comments

COMMENT ON COLUMN merchant.id IS 'Record ID';
COMMENT ON COLUMN merchant.api_key IS 'Company API Key';
COMMENT ON COLUMN merchant.merchant_id IS 'Merchant ID';
COMMENT ON COLUMN merchant.public_key IS 'RSA Public key';