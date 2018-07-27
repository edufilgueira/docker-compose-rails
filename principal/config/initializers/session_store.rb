# frozen_string_literal: true

Rails.application.config.session_store ActionDispatch::Session::CacheStore, key: '_erp_seas_session', expire_after: 1.day
