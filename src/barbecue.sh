#!/bin/bash

api="https://barbecue.backk.studio"
sign=null
vk_user_id=null
vk_ts=null
vk_ref=null
user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36"

function authenticate() {
	# 1 - sign: (string): <sign>
	# 2 - vk_user_id: (integer): <vk_user_id>
	# 3 - vk_ts: (integer): <vk_ts>
	# 4 - vk_ref: (string): <vk_ref>
	# 5 - vk_hash_session: (integer): <vk_hash_session>
	# 6 - access_token_settings: (string): <access_token_settings - default: >
	# 7 - are_notifications_enabled: (integer): <are_notifications_enabled: default: 0>
	# 8 - is_app_user: (integer): <is_app_user - default: 0>
	# 9 - is_favorite: (integer): <is_favorite - default: 0>
	# 10 - language: (string): <language - default: ru>
	# 11 - platform: (string): <platform - default: desktop_web>
	sign=$1
	vk_user_id=$2
	vk_ts=$3
	vk_ref=$4
	vk_hash_session=$5
	params="vk_access_token_settings=${6:-}&vk_app_id=7842824&vk_are_notifications_enabled=${7:-0}&vk_is_app_user=${8:-0}&vk_is_favorite=${9:-0}&vk_language=${10:-ru}&vk_platform=${11:-desktop_web}&vk_ref=$vk_ref&vk_ts=$vk_ts&vk_user_id=$vk_user_id&sign=$sign&vk_hash_session=$vk_hash_session"
	echo $params
}

function get_account_info() {
	curl --request GET \
		--url "$api/isAccount" \
		--user-agent "$user_agent" \
		--header "content-type: application/json" \
		--header "xvk: $params"
}

function get_meats() {
	curl --request GET \
		--url "$api/meatsList" \
		--user-agent "$user_agent" \
		--header "content-type: application/json" \
		--header "xvk: $params"
}

function get_grills() {
	curl --request GET \
		--url "$api/grillList" \
		--user-agent "$user_agent" \
		--header "content-type: application/json" \
		--header "xvk: $params"
}

function get_markets() {
	curl --request GET \
		--url "$api/markets-list" \
		--user-agent "$user_agent" \
		--header "content-type: application/json" \
		--header "xvk: $params"
}

function get_artefacts() {
	curl --request GET \
		--url "$api/artefacts-list" \
		--user-agent "$user_agent" \
		--header "content-type: application/json" \
		--header "xvk: $params"
}

function buy_grill() {
	# 1 - grill_id: (integer): <grill_id>
	curl --request POST \
		--url "$api/buy-grill?grill=$1" \
		--user-agent "$user_agent" \
		--header "content-type: application/json" \
		--header "xvk: $params"
}

function get_rating() {
	# 1 - type: (string): <type>
	curl --request GET \
		--url "$api/rating-$1" \
		--user-agent "$user_agent" \
		--header "content-type: application/json" \
		--header "xvk: $params"
}

function get_daily_bonus() {
	curl --request GET \
		--url "$api/dailyBonus" \
		--user-agent "$user_agent" \
		--header "content-type: application/json" \
		--header "xvk: $params"
}

function activate_promo() {
	# 1 - promo: (string): <promo>
	curl --request GET \
		--url "$api/activate-promo?promo=$1" \
		--user-agent "$user_agent" \
		--header "content-type: application/json" \
		--header "xvk: $params"
}

function get_referrals_list() {
	curl --request GET \
		--url "$api/referals-list" \
		--user-agent "$user_agent" \
		--header "content-type: application/json" \
		--header "xvk: $params"
}

function transfer_money() {
	# 1 - transfer_id: (integer): <transfer_id>
	# 2 - amount: (integer): <amount>
	curl --request GET \
		--url "$api/transfer-money?transfer_id=$1&amount=$2" \
		--user-agent "$user_agent" \
		--header "content-type: application/json" \
		--header "xvk: $params"
}

function buy_meat() {
	# 1 - meat_id: (string): <meat_id>
	# 2 - count: (integer): <count>
	curl --request POST \
		--url "$api/buy-meat?meat=$1&count=$2" \
		--user-agent "$user_agent" \
		--header "content-type: application/json" \
		--header "xvk: $params"
}

function cook_barbecue() {
	# 1 - meat: (string): <meat>
	curl --request GET \
		--url "$api/cook-barbecue?meat=$1" \
		--user-agent "$user_agent" \
		--header "content-type: application/json" \
		--header "xvk: $params"
}
