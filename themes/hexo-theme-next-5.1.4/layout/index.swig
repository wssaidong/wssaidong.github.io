{% extends '_layout.swig' %}
{% import '_macro/post.swig' as post_template %}
{% import '_macro/sidebar.swig' as sidebar_template %}

{% block title %}{{ config.title }}{% if theme.index_with_subtitle and config.subtitle %} - {{config.subtitle }}{% endif %}{% endblock %}

{% block page_class %}
  {% if is_home() %}page-home{% endif -%}
{% endblock %}

{% block content %}
  <section id="posts" class="posts-expand">
	<div style="overflow: hidden;">
		<script type="text/javascript">
		var sogou_ad_id=957680;
		var sogou_ad_height=60;
		var sogou_ad_width=960;
		</script>
		<script type='text/javascript' src='http://images.sohu.com/cs/jsfile/js/c.js'></script>
	</div>
    {% for post in page.posts %}
      {{ post_template.render(post, true) }}
    {% endfor %}
  </section>

  {% include '_partials/pagination.swig' %}
{% endblock %}

{% block sidebar %}
  {{ sidebar_template.render(false) }}
{% endblock %}
