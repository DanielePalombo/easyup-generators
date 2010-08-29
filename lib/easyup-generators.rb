# Easyup-generators

ActionView::Helpers::AssetTagHelper.register_stylesheet_expansion :jquery => ["jquery/jquery-ui.css"]
ActionView::Helpers::AssetTagHelper.register_javascript_expansion :jquery_core => ["jquery.min"]
ActionView::Helpers::AssetTagHelper.register_javascript_expansion :jquery_ui => ["jquery-ui.min"]
ActionView::Helpers::AssetTagHelper.register_javascript_expansion :jquery => ["jquery.min", "jquery-ui.min"]
ActionView::Helpers::AssetTagHelper.register_javascript_expansion :jquery_defaults => ["jquery.min", "jquery-ui.min", "rails", "application"]
