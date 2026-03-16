{% set titulo_cotizador_title = settings.titulo_cotizador_title %}
{% set subtitulo_cotizador_title = settings.subtitulo_cotizador_title %}
<section class="section-cotizador" id="cotizador-home">
	<div
		class="container-fluid container-cotizador">

		<!-- Encabezado -->
		<header class="cotizador-header text-center">

			<h2 class="cotizador-title">{{titulo_cotizador_title}}</h2>
			<p class="cotizador-subtitle">
				{{subtitulo_cotizador_title}}
			</p>
		</header>

		<!-- Progreso -->
		<div class="cotizador-progress">
			<div class="cotizador-progress-steps-labels">
				<span class="cotizador-progress-step-label is-active" data-step="1">Línea de producto</span>
				<span class="cotizador-progress-step-label" data-step="2">Volumen a considerar</span>
				<span class="cotizador-progress-step-label mr-2 mr-md-0" data-step="3">Plazo y modalidad de entrega</span>
				<span class="cotizador-progress-step-label" data-step="4">Punto de enlace</span>
			</div>

			<div class="cotizador-progress-bar">
				<div class="cotizador-progress-bar-fill" id="cotizador-progress-fill"></div>
			</div>

			<div class="cotizador-progress-counter">
				Paso
				<span id="cotizador-step-current">1</span>
				de 4
			</div>
		</div>

		<!-- Formulario -->
		<form
			id="cotizador-form" class="cotizador-form" autocomplete="off" method="post" action="/winnie-pooh" onsubmit="this.setAttribute('action','');" data-store="contact-form">

			{# Honeypot igual al del contact form #}
			<div class="winnie-pooh hidden">
				<label for="winnie-pooh">{{ "No completar este campo" | translate }}:</label>
				<input type="text" id="winnie-pooh" name="winnie-pooh">
			</div>

			{# Tipo de formulario de contacto estándar #}
			<input
			type="hidden" name="type" value="contact">

			{# Campo message oculto: acá vamos a inyectar el string armado #}
			<textarea name="message" class="hidden" style="display:none;"></textarea>
			<!-- Paso 1 -->
			<div class="cotizador-step is-active" data-step="1">
				<h3 class="cotizador-step-title">
					1 - ¿Qué línea de productos necesitás para tu proyecto?
				</h3>
				<p class="cotizador-step-helper">Podés seleccionar una o más opciones</p>

				<div class="cotizador-grid-options">

					<label class="cotizador-option">
						<input type="checkbox" name="linea_producto[]" value="carteleria_exterior">
						<span>Cartelería exterior</span>
						<span class="cotizador-option-chevron">
							{% include "snipplets/svg/chevron-right.tpl" with { svg_custom_class: "cotizador-chevron-icon" } %}
						</span>

					</label>

					<label class="cotizador-option">
						<input type="checkbox" name="linea_producto[]" value="grafica_autoadhesiva">
						<span>Gráfica autoadhesiva</span>
						<span class="cotizador-option-chevron">
							{% include "snipplets/svg/chevron-right.tpl" with { svg_custom_class: "cotizador-chevron-icon" } %}
						</span>
					</label>

					<label class="cotizador-option">
						<input type="checkbox" name="linea_producto[]" value="eventos_aire_libre">
						<span>Eventos aire libre</span>
						<span class="cotizador-option-chevron">
							{% include "snipplets/svg/chevron-right.tpl" with { svg_custom_class: "cotizador-chevron-icon" } %}
						</span>
					</label>

					<label class="cotizador-option">
						<input type="checkbox" name="linea_producto[]" value="eventos_interior">
						<span>Eventos en interior</span>
						<span class="cotizador-option-chevron">
							{% include "snipplets/svg/chevron-right.tpl" with { svg_custom_class: "cotizador-chevron-icon" } %}
						</span>
					</label>

					<label class="cotizador-option">
						<input type="checkbox" name="linea_producto[]" value="displays_pop">
						<span>Displays/POP</span>
						<span class="cotizador-option-chevron">
							{% include "snipplets/svg/chevron-right.tpl" with { svg_custom_class: "cotizador-chevron-icon" } %}
						</span>
					</label>

					<label class="cotizador-option">
						<input type="checkbox" name="linea_producto[]" value="otros">
						<span>Otros</span>
					</label>
				</div>

				<div class="cotizador-otros-wrapper">
					<label for="cotizador-otros" class="cotizador-otros-label">
						Otros, ¿cuál?
					</label>
					<input id="cotizador-otros" type="text" name="linea_producto_otro" class="cotizador-input" placeholder="Contanos brevemente qué tenés en mente">
				</div>
			</div>

			<!-- Paso 2 -->
			<div class="cotizador-step" data-step="2">
				<h3 class="cotizador-step-title">
					2 - ¿Cuál es el volumen que debemos considerar?
				</h3>

				<div class="cotizador-grid-options">
					<label class="cotizador-option">
						<input type="radio" name="volumen" value="100_1000">
						<span>100 – 1.000 unidades</span>
						<span class="cotizador-option-chevron">
							{% include "snipplets/svg/chevron-right.tpl" with { svg_custom_class: "cotizador-chevron-icon" } %}
						</span>
					</label>

					<label class="cotizador-option">
						<input type="radio" name="volumen" value="1000_3000">
						<span>1.000 – 3.000 unidades</span>
						<span class="cotizador-option-chevron">
							{% include "snipplets/svg/chevron-right.tpl" with { svg_custom_class: "cotizador-chevron-icon" } %}
						</span>
					</label>

					<label class="cotizador-option">
						<input type="radio" name="volumen" value="3000_10000">
						<span>3.000 – 10.000 unidades</span>
						<span class="cotizador-option-chevron">
							{% include "snipplets/svg/chevron-right.tpl" with { svg_custom_class: "cotizador-chevron-icon" } %}
						</span>
					</label>

					<label class="cotizador-option">
						<input type="radio" name="volumen" value="10000_mas">
						<span>Más de 10.000 unidades</span>
						<span class="cotizador-option-chevron">
							{% include "snipplets/svg/chevron-right.tpl" with { svg_custom_class: "cotizador-chevron-icon" } %}
						</span>
					</label>
				</div>
			</div>

			<!-- Paso 3 -->
			<div class="cotizador-step" data-step="3">
				<h3 class="cotizador-step-title">
					3 - ¿Qué plazo y modalidad de entrega debemos considerar?
				</h3>

				<div class="cotizador-step-block">
					<p class="cotizador-step-subtitle">Plazo de entrega (elegí una opción)</p>
					<div class="cotizador-grid-options">
						<label class="cotizador-option">
							<input type="radio" name="plazo_entrega" value="fecha_especifica">
							<span>Fecha específica</span>
							<span class="cotizador-option-chevron">
								{% include "snipplets/svg/chevron-right.tpl" with { svg_custom_class: "cotizador-chevron-icon" } %}
							</span>
						</label>

						<label class="cotizador-option">
							<input type="radio" name="plazo_entrega" value="periodo_estimado">
							<span>Dentro de un período estimado</span>
							<span class="cotizador-option-chevron">
								{% include "snipplets/svg/chevron-right.tpl" with { svg_custom_class: "cotizador-chevron-icon" } %}
							</span>
						</label>


					</div>

					<div class="cotizador-plazo-extra">
						<div class="cotizador-plazo-fecha js-plazo-fecha" style="display:none;">
							<label for="cotizador-fecha" class="cotizador-otros-label">Fecha específica</label>
							<input type="date" id="cotizador-fecha" name="fecha_especifica" class="cotizador-input">
						</div>

						<div class="cotizador-plazo-periodo js-plazo-periodo" style="display:none;">
							<label for="cotizador-periodo" class="cotizador-otros-label">Período estimado</label>
							<select id="cotizador-periodo" name="periodo_estimado" class="cotizador-input">
								<option value="">Seleccioná una opción</option>
								<option value="esta_semana">Esta semana</option>
								<option value="15_dias">Próximos 15 días</option>
								<option value="este_mes">Este mes</option>
							</select>
						</div>
					</div>
				</div>

				<div class="cotizador-step-block">
					<p class="cotizador-step-subtitle">Modalidad de compra (elegí una opción)</p>
					<div class="cotizador-grid-options">
						<label class="cotizador-option">
							<input type="radio" name="modalidad_compra" value="abastecimiento_continuo">
							<span>Abastecimiento continuo</span>
							<span class="cotizador-option-chevron">
								{% include "snipplets/svg/chevron-right.tpl" with { svg_custom_class: "cotizador-chevron-icon" } %}
							</span>
						</label>

						<label class="cotizador-option">
							<input type="radio" name="modalidad_compra" value="compra_anual">
							<span>Compra anual programada</span>
							<span class="cotizador-option-chevron">
								{% include "snipplets/svg/chevron-right.tpl" with { svg_custom_class: "cotizador-chevron-icon" } %}
							</span>
						</label>

						<label class="cotizador-option">
							<input type="radio" name="modalidad_compra" value="compra_puntual">
							<span>Compra puntual única</span>
							<span class="cotizador-option-chevron">
								{% include "snipplets/svg/chevron-right.tpl" with { svg_custom_class: "cotizador-chevron-icon" } %}
							</span>
						</label>
					</div>
				</div>
			</div>

			<!-- Paso 4 -->
			<div class="cotizador-step" data-step="4">
				<h3 class="cotizador-step-title">
					4 - ¿Quién será nuestro punto de enlace para avanzar?
				</h3>

				<div class="cotizador-grid-fields">
					<div class="cotizador-field">
						<label>Nombre y Apellido *</label>
						<input type="text" name="nombre" class="cotizador-input" required>
					</div>
					<div class="cotizador-field">
						<label>Correo *</label>
						<input type="email" name="email" class="cotizador-input" required>
					</div>
					<div class="cotizador-field">
						<label>Teléfono *</label>
						<input type="tel" name="telefono" class="cotizador-input" required>
					</div>
					<div class="cotizador-field">
						<label>Empresa *</label>
						<input type="text" name="empresa" class="cotizador-input" required>
					</div>
					<div class="cotizador-field">
						<label>Cargo</label>
						<input type="text" name="cargo" class="cotizador-input">
					</div>
					<div class="cotizador-field">
						<label>Rubro</label>
						<input type="text" name="rubro" class="cotizador-input">
					</div>
				</div>

				<div class="cotizador-field">
					<label>Observaciones (opcional)</label>
					<textarea name="observaciones" class="cotizador-input cotizador-textarea" rows="3"></textarea>
				</div>

				{# <div class="cotizador-field">
					<label>Subir archivo de diseño (opcional)</label>
					<input type="file" name="archivo" class="cotizador-input">
				</div> #}
			</div>

			<!-- Acciones -->
			<div class="cotizador-actions">
				<button type="button" id="cotizador-next" class="cotizador-btn cotizador-btn-next mb-3" disabled>
					Siguiente
				</button>
				<button type="submit" id="cotizador-submit" class="cotizador-btn cotizador-btn-submit" name="contact" value="1" style="display:none;">
					Iniciar atención personalizada
				</button>
			</div>
		</form>
	</div>
</section>

<script>
document.addEventListener("DOMContentLoaded", function () {

  // ==========================
  // 1) Banner de éxito (post-submit)
  // ==========================
  if (sessionStorage.getItem("cotizador_success") === "1") {
    sessionStorage.removeItem("cotizador_success");

    var successAlert = document.createElement("div");
    successAlert.className = "cotizador-alert-success";
    successAlert.innerHTML = '' +
      '<span>Tu consulta fue enviada con éxito. En breve nos pondremos en contacto.</span>' +
      '<button type="button" class="cotizador-alert-close" aria-label="Cerrar">&times;</button>';

    // Intentamos insertarlo justo debajo del header principal si existe
    var head = document.querySelector(".js-head-main");
    if (head && head.parentNode) {
      head.parentNode.insertBefore(successAlert, head.nextSibling);
    } else {
      // fallback: al inicio del body
      document.body.insertBefore(successAlert, document.body.firstChild);
    }

    var closeBtn = successAlert.querySelector(".cotizador-alert-close");
    if (closeBtn) {
      closeBtn.addEventListener("click", function () {
        if (successAlert.parentNode) {
          successAlert.parentNode.removeChild(successAlert);
        }
      });
    }
  }

  var form = document.getElementById("cotizador-form");
  if (!form) return;

  var totalSteps = 4;
  var currentStep = 1;

  var steps = Array.prototype.slice.call(
    form.querySelectorAll(".cotizador-step")
  );
  var progressFill = document.getElementById("cotizador-progress-fill");
  var stepCounter = document.getElementById("cotizador-step-current");
  var stepLabels = Array.prototype.slice.call(
    document.querySelectorAll(".cotizador-progress-step-label")
  );

  var nextBtn = document.getElementById("cotizador-next");
  var submitBtn = document.getElementById("cotizador-submit");

  // ==========================
  // Captcha: referencia global
  // ==========================
  var captchaContainer = null;

  function updateCaptchaVisibility() {
    if (!captchaContainer) {
      captchaContainer = document.getElementById("rc-anchor-container");
    }
    if (captchaContainer) {
      // Sólo mostrar en el paso 4
      captchaContainer.style.display = (currentStep === 4) ? "" : "none";
    }
  }

  function updateProgressUI() {
    steps.forEach(function (step) {
      step.classList.toggle(
        "is-active",
        Number(step.getAttribute("data-step")) === currentStep
      );
    });

    stepLabels.forEach(function (label) {
      var step = Number(label.getAttribute("data-step"));
      label.classList.toggle("is-active", step === currentStep);
      label.classList.toggle("is-completed", step < currentStep);
    });

    var percent = ((currentStep - 1) / (totalSteps - 1)) * 100;
    progressFill.style.width = percent + "%";
    stepCounter.textContent = currentStep;

    if (currentStep === totalSteps) {
      nextBtn.style.display = "none";
      submitBtn.style.display = "inline-block";
      nextBtn.disabled = false;
    } else {
      nextBtn.style.display = "inline-block";
      submitBtn.style.display = "none";
    }

    // Actualizamos visibilidad del captcha en cada cambio de paso
    updateCaptchaVisibility();
  }

  function goToStep(step) {
    if (step < 1 || step > totalSteps) return;

    currentStep = step;
    updateProgressUI();
    validateCurrentStep();
  }

  nextBtn.addEventListener("click", function () {
    if (nextBtn.disabled) return;

    if (currentStep < totalSteps) {
      goToStep(currentStep + 1);
    }
  });

  var step1 = form.querySelector('[data-step="1"]');
  var step1Checks = step1.querySelectorAll('input[type="checkbox"]');

  function validateStep1() {
    var anyChecked = Array.prototype.slice
      .call(step1Checks)
      .some(function (input) {
        return input.checked;
      });
    nextBtn.disabled = !anyChecked;
  }
  Array.prototype.forEach.call(step1Checks, function (input) {
    input.addEventListener("change", validateStep1);
  });

  var step2 = form.querySelector('[data-step="2"]');
  var step2Radios = step2.querySelectorAll('input[type="radio"]');

  function validateStep2() {
    var anyChecked = Array.prototype.slice
      .call(step2Radios)
      .some(function (input) {
        return input.checked;
      });
    nextBtn.disabled = !anyChecked;
  }

  Array.prototype.forEach.call(step2Radios, function (input) {
    input.addEventListener("change", function () {
      validateStep2();
      if (input.checked) {
        goToStep(3);
      }
    });
  });

  var step3 = form.querySelector('[data-step="3"]');
  var plazoRadios = step3.querySelectorAll('input[name="plazo_entrega"]');
  var modalidadRadios = step3.querySelectorAll(
    'input[name="modalidad_compra"]'
  );

  function updatePlazoExtras() {
    var selected = Array.prototype.slice.call(plazoRadios).find(function (r) {
      return r.checked;
    });
    var fechaBox = step3.querySelector(".js-plazo-fecha");
    var periodoBox = step3.querySelector(".js-plazo-periodo");

    if (!selected) {
      fechaBox.style.display = "none";
      periodoBox.style.display = "none";
      return;
    }
    if (selected.value === "fecha_especifica") {
      fechaBox.style.display = "block";
      periodoBox.style.display = "none";
    } else if (selected.value === "periodo_estimado") {
      fechaBox.style.display = "none";
      periodoBox.style.display = "block";
    }
  }

  function validateStep3() {
    var plazoOk = Array.prototype.slice
      .call(plazoRadios)
      .some(function (input) {
        return input.checked;
      });
    var modalidadOk = Array.prototype.slice
      .call(modalidadRadios)
      .some(function (input) {
        return input.checked;
      });
    var valid = plazoOk && modalidadOk;
    nextBtn.disabled = !valid;
    return valid;
  }

  Array.prototype.forEach.call(plazoRadios, function (input) {
    input.addEventListener("change", function () {
      updatePlazoExtras();
      if (validateStep3()) {
        goToStep(4);
      }
    });
  });

  Array.prototype.forEach.call(modalidadRadios, function (input) {
    input.addEventListener("change", function () {
      if (validateStep3()) {
        goToStep(4);
      }
    });
  });

  function validateCurrentStep() {
    if (currentStep === 1) {
      validateStep1();
    } else if (currentStep === 2) {
      validateStep2();
    } else if (currentStep === 3) {
      validateStep3();
    } else {
      nextBtn.disabled = false;
    }
  }

  updateProgressUI();
  validateCurrentStep();

  // En caso de que el captcha cargue tarde, chequeamos hasta encontrarlo
  var captchaInterval = setInterval(function () {
    var el = document.getElementById("rc-anchor-container");
    if (el) {
      captchaContainer = el;
      updateCaptchaVisibility();
      clearInterval(captchaInterval);
    }
  }, 500);

  function buildCotizadorMessage(form) {
    function getCheckedLabels(selector) {
      var nodes = form.querySelectorAll(selector);
      var labels = [];
      Array.prototype.forEach.call(nodes, function (input) {
        if (!input.checked) return;

        var label = input.closest("label");
        if (label) {
          var textSpan = label.querySelector("span");
          var txt = textSpan ? textSpan.textContent.trim() : input.value;
          labels.push(txt);
        } else {
          labels.push(input.value);
        }
      });
      return labels;
    }

    // Paso 1
    var lineas = getCheckedLabels('input[name="linea_producto[]"]');
    var lineaOtro = form.querySelector('input[name="linea_producto_otro"]');

    // Paso 2
    var volumen = getCheckedLabels('input[name="volumen"]')[0] || "";

    // Paso 3
    var plazo = getCheckedLabels('input[name="plazo_entrega"]')[0] || "";
    var modalidad = getCheckedLabels('input[name="modalidad_compra"]')[0] || "";

    var fechaEspecifica = form.querySelector('input[name="fecha_especifica"]');
    var periodoEstimado = form.querySelector('select[name="periodo_estimado"]');

    // Paso 4 – datos de contacto
    var nombre = form.querySelector('input[name="nombre"]');
    var email = form.querySelector('input[name="email"]');
    var telefono = form.querySelector('input[name="telefono"]');
    var empresa = form.querySelector('input[name="empresa"]');
    var cargo = form.querySelector('input[name="cargo"]');
    var rubro = form.querySelector('input[name="rubro"]');
    var observaciones = form.querySelector('textarea[name="observaciones"]');

    var msg = "";

    msg += "Formulario de cotización enviado desde el home.\n\n";

    // Paso 1
    msg +=
      "Línea de productos: " +
      (lineas.length ? lineas.join(", ") : "No especificado") +
      "\n";
    if (lineaOtro && lineaOtro.value.trim()) {
      msg += "Otros: " + lineaOtro.value.trim() + "\n";
    }

    // Paso 2
    msg += "\nVolumen estimado: " + (volumen || "No especificado") + "\n";

    // Paso 3
    msg += "\nPlazo de entrega: " + (plazo || "No especificado") + "\n";
    if (fechaEspecifica && fechaEspecifica.value) {
      msg += " - Fecha específica: " + fechaEspecifica.value + "\n";
    }
    if (periodoEstimado && periodoEstimado.value) {
      var textoPeriodo =
        periodoEstimado.options[periodoEstimado.selectedIndex].text;
      msg += " - Período estimado: " + textoPeriodo + "\n";
    }

    msg += "\nModalidad de compra: " + (modalidad || "No especificado") + "\n";

    // Paso 4
    msg += "\nDatos de contacto:\n";
    msg += " - Nombre y Apellido: " + (nombre ? nombre.value : "") + "\n";
    msg += " - Empresa: " + (empresa ? empresa.value : "") + "\n";
    msg += " - Cargo: " + (cargo ? cargo.value : "") + "\n";
    msg += " - Rubro: " + (rubro ? rubro.value : "") + "\n";
    msg += " - Teléfono: " + (telefono ? telefono.value : "") + "\n";
    msg += " - Correo: " + (email ? email.value : "") + "\n";

    if (observaciones && observaciones.value.trim()) {
      msg += "\nObservaciones:\n" + observaciones.value.trim() + "\n";
    }

    return msg;
  }

  form.addEventListener("submit", function (e) {
    // Armamos el mensaje
    var msg = buildCotizadorMessage(form);

    var messageField = form.querySelector('textarea[name="message"]');
    if (!messageField) {
      messageField = document.createElement("textarea");
      messageField.name = "message";
      messageField.style.display = "none";
      form.appendChild(messageField);
    }
    messageField.value = msg;

    // Mapear name, email, phone
    function syncHidden(nameContact, nameSource) {
      var source = form.querySelector('[name="' + nameSource + '"]');
      var hidden = form.querySelector('input[name="' + nameContact + '"]');
      if (!hidden) {
        hidden = document.createElement("input");
        hidden.type = "hidden";
        hidden.name = nameContact;
        form.appendChild(hidden);
      }
      hidden.value = source ? source.value : "";
    }

    syncHidden("name", "nombre");
    syncHidden("email", "email");
    syncHidden("phone", "telefono");

    // Marcamos en sessionStorage para mostrar el banner tras el reload
    sessionStorage.setItem("cotizador_success", "1");
    // Importante: NO hacemos preventDefault, dejamos que el form se envíe normal
  });
});
</script>
