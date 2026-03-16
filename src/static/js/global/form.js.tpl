{#/*============================================================================
      #Forms
    ==============================================================================*/ #}

    jQueryNuvem(".js-winnie-pooh-form").on("submit", function (e) {
        jQueryNuvem(e.currentTarget).attr('action', '');
    });

    {# Show the success or error message when resending the validation link #}

    {% if template == 'account.register' or template == 'account.login' %}
        jQueryNuvem(".js-resend-validation-link").on("click", function(e){
            window.accountVerificationService.resendVerificationEmail('{{ customer_email }}');
        });
    {% endif %}

    {% if template == 'account.login' %}
        {% if result.invalid %}
            jQueryNuvem(".js-account-input").addClass("alert-danger");
            jQueryNuvem(".js-account-input.alert-danger").on("focus", function() {
                jQueryNuvem(".js-account-input").removeClass("alert-danger");
            });
        {% endif %}
    {% endif %}

    jQueryNuvem('.js-password-view').on("click", function (e) {
        jQueryNuvem(e.currentTarget).toggleClass('password-view');

        if(jQueryNuvem(e.currentTarget).hasClass('password-view')){
            jQueryNuvem(e.currentTarget).parent().find(".js-password-input").attr('type', '');
            jQueryNuvem(e.currentTarget).find(".js-eye-open, .js-eye-closed").toggle();
        } else {
            jQueryNuvem(e.currentTarget).parent().find(".js-password-input").attr('type', 'password');
            jQueryNuvem(e.currentTarget).find(".js-eye-open, .js-eye-closed").toggle();
        }
    });

{# // ===== Custom Select (vanilla JS) con buscador ===== #}

{# // ---------- Helpers ---------- #}
function rootFrom(el){ return el.closest('[data-select]'); }

function nodes(root){
  return {
    btn:     root.querySelector('.custom-select-button'),
    text:    root.querySelector('.custom-select-text'),
    list:    root.querySelector('.custom-select-list'),
    input:   root.querySelector('input[type="hidden"]'),
    options: root.querySelector('[data-role="options"]') || root.querySelector('.custom-select-list'),
    search:  root.querySelector('[data-role="search"]'),
    nores:   root.querySelector('[data-role="noresults"]'),
  };
}

function getFilterables(root){
  const scope = nodes(root).options || root;
  return Array.from(scope.querySelectorAll('[data-role="option"], .custom-select-option, .checkbox-item'))
    .filter(el => el.getAttribute('data-role') !== 'ignore');
}

{# // ---------- Abrir / cerrar ---------- #}
function openSelect(root){
  if (String(root.dataset.disabled) === 'true') return;
  const N = nodes(root);

  N.list.hidden = false;
  root.classList.add('is-open');
  N.btn.setAttribute('aria-expanded','true');

  {# // buscador: limpiar + foco #}
  const searchable = root.dataset.searchable === 'true' || root.dataset.searchable === true;
  if (searchable && N.search){
    N.search.value = '';
    filterOptions(root, '');
    setTimeout(() => { N.search.focus(); N.search.select && N.search.select(); }, 0);
  }

  {# // resaltar seleccionado o primer habilitado #}
  let sel = root.querySelector('.custom-select-option.is-selected');
  if (!sel) sel = root.querySelector('.custom-select-option:not(.is-disabled)');
  highlight(root, sel);

  {# // cerrar otros abiertos #}
  document.querySelectorAll('[data-select].is-open').forEach(cs => {
    if (cs !== root) closeSelect(cs);
  });
}

function closeSelect(root){
  const N = nodes(root);
  N.list.hidden = true;
  root.classList.remove('is-open');
  N.btn.setAttribute('aria-expanded','false');

  if (N.search){
    N.search.value = '';
    filterOptions(root, '');
  }
  N.btn.focus();
}

{# // ---------- Navegación / resalte ---------- #}
function highlight(root, optEl){
  Array.from(root.querySelectorAll('.custom-select-option')).forEach(el => el.classList.remove('is-active'));
  if (!optEl) return;
  optEl.classList.add('is-active');

  const N = nodes(root);
  const list = N.list;
  if (!list || !optEl) return;

  const lr = list.getBoundingClientRect();
  const r  = optEl.getBoundingClientRect();
  if (r.top < lr.top)       list.scrollTop -= (lr.top - r.top);
  else if (r.bottom > lr.bottom) list.scrollTop += (r.bottom - lr.bottom);
}

function move(root, delta){
  const all = Array.from(root.querySelectorAll('.custom-select-option'));
  if (!all.length) return;

  let curr = root.querySelector('.custom-select-option.is-active')
          || root.querySelector('.custom-select-option.is-selected')
          || all[0];

  let idx = Math.max(0, all.indexOf(curr));
  let next = idx;

  {# // saltar deshabilitados #}
  do {
    next = (next + delta + all.length) % all.length;
  } while (all[next].classList.contains('is-disabled') && next !== idx);

  highlight(root, all[next]);
}

{# // ---------- Selección (UI + hidden) ---------- #}
function selectUI(root, liEl, triggerChange){
  if (!liEl || liEl.classList.contains('is-disabled')) return;
  const N = nodes(root);
  const placeholder = root.dataset.placeholder || 'Seleccioná una opción';

  {# // marcar selección en <li> #}
  Array.from(root.querySelectorAll('.custom-select-option')).forEach(el=>{
    el.classList.remove('is-selected');
    el.setAttribute('aria-selected','false');
  });
  if (liEl.classList.contains('custom-select-option')){
    liEl.classList.add('is-selected');
    liEl.setAttribute('aria-selected','true');
  }

  {# // valor/label #}
  let value = '';
  if (liEl.hasAttribute('data-value'))   value = String(liEl.getAttribute('data-value'));
  else if (liEl.hasAttribute('data-option')) value = String(liEl.getAttribute('data-option'));

  const rawLabel = liEl.getAttribute('data-label') ?? liEl.textContent ?? '';
  const label = String(rawLabel).trim();

  {# // hidden + texto #}
  if (N.input) N.input.value = value;
  if (N.text)  N.text.textContent = label || value || placeholder;

  if (triggerChange !== false){
    {# // evento custom #}
    const ev = new CustomEvent('cselect:change', { detail: { value, label } });
    root.dispatchEvent(ev);

    {# // autosubmit #}
    if (String(root.dataset.autosubmit) === 'true'){
      const form = root.closest('form');
      form && form.submit && form.submit();
    }
  }
}

{# // ---------- Buscador ---------- #}
function filterOptions(root, term){
  const N = nodes(root);
  const items = getFilterables(root);
  const t = String(term || '').toLowerCase().trim();
  let visible = 0;

  items.forEach(el=>{
    const raw = el.getAttribute('data-label') ?? el.textContent ?? '';
    const label = String(raw).toLowerCase();
    const match = !t || label.indexOf(t) !== -1;
    el.style.display = match ? '' : 'none';
    if (match) visible++;
  });

  if (N.nores) N.nores.classList.toggle('d-none', visible > 0);
}

function bindSearch(root){
  const N = nodes(root);
  if (!N.search) return;

  N.search.addEventListener('input', () => {
    filterOptions(root, N.search.value);
  });

  N.search.addEventListener('keydown', (e)=>{
    if (e.key === 'ArrowDown'){
      e.preventDefault();
      move(root, +1);
      nodes(root).list && nodes(root).list.focus && nodes(root).list.focus();
    } else if (e.key === 'Enter'){
      e.preventDefault(); // evitar submit accidental
    }
  });
}

{# // ---------- Init ---------- #}
function initOne(root){
  if (root.__csel_init__) return;
  root.__csel_init__ = true;

  const N = nodes(root);
  const placeholder = root.dataset.placeholder || 'Seleccioná una opción';

  {# // asegurar hidden #}
  if (!N.input){
    const id = String(root.dataset.id || ('custom-' + Date.now()));
    const name = String(root.dataset.name || id);
    const hidden = document.createElement('input');
    hidden.type = 'hidden';
    hidden.id = id;
    hidden.name = name;
    root.prepend(hidden);
    N.input = hidden;
  }

  {# // estado inicial #}
  let initial = root.querySelector('.custom-select-option.is-selected');
  if (!initial && N.input && N.input.value){
    const wanted = String(N.input.value);
    initial = Array.from(root.querySelectorAll('.custom-select-option'))
              .find(opt => String(opt.getAttribute('data-value')||'') === wanted);
  }
  if (initial){
    selectUI(root, initial, false);
  } else {
    if (N.input) N.input.value = '';
    if (N.text)  N.text.textContent = placeholder;
  }

  bindSearch(root);
}

function initAll(){
  document.querySelectorAll('[data-select]').forEach(initOne);
}

{# // ---------- Delegación de eventos ---------- #}
document.addEventListener('click', (e)=>{
  const btn = e.target.closest('.custom-select-button');
  if (btn){
    e.preventDefault();
    const root = rootFrom(btn);
    if (!root) return;
    root.classList.contains('is-open') ? closeSelect(root) : openSelect(root);
    return;
  }

  {# // click en opción tipo <li class="custom-select-option"> #}
  const opt = e.target.closest('.custom-select-option');
  if (opt){
    const root = rootFrom(opt);
    if (!root || opt.classList.contains('is-disabled')) return;
    selectUI(root, opt, true);
    closeSelect(root);
    return;
  }

  {# // click fuera → cerrar #}
  document.querySelectorAll('[data-select].is-open').forEach(root=>{
    if (!root.contains(e.target)) closeSelect(root);
  });
});

{# // teclado en botón #}
document.addEventListener('keydown', (e)=>{
  const btn = e.target.closest('.custom-select-button');
  if (!btn) return;
  const root = rootFrom(btn);
  if (!root) return;

  const k = e.key;
  if (k === 'ArrowDown' || k === 'Down'){ e.preventDefault(); openSelect(root); }
  else if (k === 'ArrowUp' || k === 'Up'){ e.preventDefault(); openSelect(root); }
  else if (k === 'Enter' || k === ' '){ e.preventDefault(); root.classList.contains('is-open') ? closeSelect(root) : openSelect(root); }
  else if (k === 'Escape'){ if (root.classList.contains('is-open')) { e.preventDefault(); closeSelect(root); } }
});

{# // teclado en lista #}
document.addEventListener('keydown', (e)=>{
  if (!e.target.classList.contains('custom-select-list')) return;
  const list = e.target;
  const root = rootFrom(list);
  if (!root) return;

  const k = e.key;
  if (k === 'ArrowDown' || k === 'Down'){ e.preventDefault(); move(root, +1); }
  else if (k === 'ArrowUp' || k === 'Up'){ e.preventDefault(); move(root, -1); }
  else if (k === 'Home'){ e.preventDefault(); const first = root.querySelector('.custom-select-option'); first && highlight(root, first); }
  else if (k === 'End'){ e.preventDefault(); const all = root.querySelectorAll('.custom-select-option'); if (all.length) highlight(root, all[all.length-1]); }
  else if (k === 'Enter' || k === ' '){
    e.preventDefault();
    const act = root.querySelector('.custom-select-option.is-active');
    if (act && !act.classList.contains('is-disabled')){
      selectUI(root, act, true);
      closeSelect(root);
    }
  } else if (k === 'Escape'){ e.preventDefault(); closeSelect(root); }
});

{# // ---------- API pública ---------- #}
window.CustomSelectUI = {
  initAll,
  setValue: function(id, value){
    const root = document.querySelector('[data-select][data-id="'+id+'"]');
    if (!root) return;
    const li = Array.from(root.querySelectorAll('.custom-select-option'))
      .find(el => String(el.getAttribute('data-value')||'') === String(value||''));
    if (li) selectUI(root, li, true);
  }
};

{# // ---------- Ready ---------- #}
initAll();

