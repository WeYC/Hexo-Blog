<div class="site-brand-container">
  <div class="site-nav-toggle">
    <div class="toggle" aria-label="{{ __('accessibility.nav_toggle') }}">
      <span class="toggle-line toggle-line-first"></span>
      <span class="toggle-line toggle-line-middle"></span>
      <span class="toggle-line toggle-line-last"></span>
    </div>
  </div>

  <div class="site-meta{%- if theme.custom_logo %} custom-logo{%- endif %}">
    {%- if theme.custom_logo and theme.scheme === 'Muse' %}
      <div class="site-meta-headline">
        <a>
          <img class="custom-logo-image" src="{{ theme.custom_logo }}" alt="{{ title }}">
        </a>
      </div>
    {%- endif %}

    <a href="{{ config.root }}" class="brand" rel="start">
      <span class="logo-line-before"><i></i></span>
      <h1 class="site-title">{{ title }}</h1>
      <span class="logo-line-after"><i></i></span>
    </a>
    {%- if subtitle %}
      <p id="jinrishici-sentence" class="site-subtitle" itemprop="description">{{ subtitle }}</p>
      <!-- <span id="jinrishici-sentence">正在加载今日诗词....</span> -->
      <script src="https://sdk.jinrishici.com/v2/browser/jinrishici.js" charset="utf-8"></script>
    {%- endif %}
    {%- if theme.custom_logo and (theme.scheme === 'Gemini' or theme.scheme === 'Pisces') %}
      <a>
        <img class="custom-logo-image" src="{{ theme.custom_logo }}" alt="{{ title }}">
      </a>
    {%- endif %}
  </div>

  <div class="site-nav-right">
    <div class="toggle popup-trigger">
      {%- if theme.algolia_search.enable or theme.local_search.enable %}
        <i class="fa fa-search fa-fw fa-lg"></i>
      {%- endif %}
    </div>
  </div>
</div>
