<link href="https://cdn.jsdelivr.net/npm/remixicon/fonts/remixicon.css" rel="stylesheet">
<div class="col-12 mb-5 pt-5">
	<div class="row mx-4 justify-content-md-start ">
		<div class="col-12 col-md-3 px-0 mb-3 mb-md-0 mr-md-3">
			<div id="local-info" class="w-100"></div>
			<div id="card-container" class="w-100 mt-4 text-center d-md-none"></div>
		</div>
		<div id="map" class="col-12 col-md-8 ml-md-3"></div>
	</div>

	 <script>
									  // 1) Inicializar mapa (igual que antes)
									  var map = L.map("map").setView([-34.588, -58.409], 12);
									  L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
									    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors',
									  }).addTo(map);
									
									  var marcadorSVG = L.divIcon({
									    className: '',
									    html:
									      '<svg xmlns="http://www.w3.org/2000/svg" width="37" height="46">' +
									      '<g transform="matrix(2.72414 0 0 2.72414 -9.07138 -4.37931)">' +
									      '<path d="m10,9.17a1.25,1.25 0 1 0 0,-2.5a1.25,1.25 0 0 0 0,2.5z" fill="#000"/>' +
									      '<path d="m10,1.67a6.67,6.67 0 0 0 -6.67,6.6c0,4.56 5.88,9.65 6.13,9.86a0.83,0.83 0 0 0 1.08,0c0.29,-0.21 6.13,-5.3 6.13,-9.86a6.67,6.67 0 0 0 -6.67,-6.6zm0,9.16a2.92,2.92 0 1 1 0,-5.83a2.92,2.92 0 0 1 0,5.83z" fill="#000"/>' +
									      '</g></svg>',
									    iconSize:    [37, 46],
									    iconAnchor:  [16, 46],
									    popupAnchor: [0, -50]
									  });
									  L.Marker.prototype.options.icon = marcadorSVG;
									
									  const locales = [
									  {
									    direccion: "Av. Juan B. Justo 7643",
									    highlight: true,
									    id: 1, 
									    lat: -34.63008844911158,
									    lng: -58.49680438821758,
									    nombre: "Rueding SRL",
									    localidad: "CABA",
									    telefono: "+54 (011) 4952 2171",
									    telefono2: "+54 9 11 2859 3658",
									    horarios: "Lunes a Viernes de 08:30 a 19:00 hs. Sabados 08:30 a 17:00 hs"
									  },
									  {
									    direccion: "Sarmiento 2566",
									    highlight: false,
									    id: 2,
									    lat: -34.60638100841531,
									    lng: -58.40300089432945,
									    nombre: "SARMIENTO 2566",
									    localidad: "BUENOS AIRES",
									    telefono: "+54 (011) 7519 8765",
									    telefono2: "+54 9 11 3622 2701",
									    horarios: "Lunes a viernes 08:30 a 18:30 hs. Sabados 8:30 a 15:00 hs"
									  },
									  {
									    direccion: "Av. Corrientes 2650",
									    highlight: false,
									    id: 3,
									    lat: -34.604812158470345,
									    lng: -58.40412555305498,
									    nombre: "AV. CORRIENTES 2650",
									    localidad: "CÓRDOBA",
									    telefono: "+54 (011) 2856 1642",
									    telefono2: null,
									    horarios: "Lunes a Viernes 08:30 a 19:00 hs. Sabados 08:30 a 17:00 hs"
									  },
									  {
									    direccion: "Castelli 344",
									    highlight: false,
									    id: 4,
									    lat: -34.63008844911158,
									    lng: -58.49680438821758,
									    nombre: "CASTELLI 344",
									    localidad: "SANTA FE",
									    telefono: "+54 (011) 4862 1325",
									    telefono2: "+54 9 11 5831 8913",
									    horarios: "Lunes a Viernes de 08:30 a 18:30 hs. Sabados 08:30 a 15:00 hs"
									  }
									];
									
									  // 3) Estado de marcadores
									  const markerById = new Map();
									  let allMarkers = [];
									
									  // 4) Helpers
									  function createBranchCard(local) {
									     let d = document.createElement('div');
									        d.className = 'branch mb-3';
									        d.id = `local-${local.id}`;
									        d.innerHTML = `
									        <div class="branch-info">
									            <div class="branch-info-title">${local.nombre}</div>
									            <div class="branch-info-subtitle">${local.direccion}</div>
									            <div>
									              <button class="btn-branch ">
									               <img src="https://i.ibb.co/PVnmcPm/ri-whatsapp-fill.png" alt="ri-whatsapp-fill" border="0">
									               <div>
									                  COORDINAR INSTALACIÓN
									                </div>
									              </button>
									               </div>
									          </div>
									        `;
									    return d;
									  }
									
									
									  function centerAndMaybePopup(lat, lng, openPopup = true) {
									    map.setView([lat, lng], openPopup ? 15 : 16);
									    if (!openPopup) return;
									    const target = L.latLng(lat, lng);
									    map.eachLayer(function(layer){
									      if (layer instanceof L.Marker && layer.getLatLng().equals(target)) {
									        layer.openPopup();
									      }
									    });
									  }
									
									  function highlightBranch(local) {
									    document.querySelectorAll('.branch .btn-branch').forEach(b => b.classList.remove('highlighted'));
									    const btn = document.querySelector(`#local-${local.id} .btn-branch`);
									    if (btn) btn.classList.add('highlighted');
									
									    // en mobile, scrollear al mapa
									    if (window.innerWidth <= 767) {
									      let branchCard = createBranchCard(local);
									      branchCard.querySelector('.btn-branch').remove();
									      const mobileCardContainer = document.getElementById('card-container');
									      mobileCardContainer.innerHTML = '';
									      mobileCardContainer.appendChild(branchCard);
									    }
									    
									    const el = document.getElementById('map');
									    if (el) el.scrollIntoView({ behavior: 'smooth', block: 'center', inline: 'nearest' });
									  }
									
									  // 5) Render del acordeón por localidad
									  function groupByLocation(list) {
									    return list.reduce((acc, l) => {
									      (acc[l.localidad] ||= []).push(l);
									      // Orden: pickUps primero
									      acc[l.localidad].sort((a,b) => (b.highlight===true) - (a.highlight===true));
									      return acc;
									    }, {});
									  }
									
									  function renderAccordion(grupos) {
									    const cont = document.getElementById('local-info');
									    cont.innerHTML = '';
									
									    // Ordenar localidades alfabéticamente
									    const localidades = Object.keys(grupos).sort((a,b)=> a.localeCompare(b, 'es', {sensitivity:'base'}));
									
									    localidades.forEach(loc => {
									      const suc = grupos[loc];
									
									      const wrapper = document.createElement('div');
									      wrapper.className = 'js-accordion-container  w-100';
									
									      const toggle = document.createElement('a');
									      toggle.href = '#';
									      toggle.className = 'js-accordion-toggle branch-toggle py-1 row mx-0 ';
									      toggle.innerHTML = `
									        <div class="col pr-0 font-weight-bold">
									          <span class="accordiong-title">${loc}</span>
									        </div>
									        <div class="col-auto pl-0">
									          <span class="js-accordion-toggle-inactive">
									            <svg class="icon-inline icon-lg mr-2"xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 512">
													<path d="M24.707 38.101L4.908 57.899c-4.686 4.686-4.686 12.284 0 16.971L185.607 256 4.908 437.13c-4.686 4.686-4.686 12.284 0 16.971L24.707 473.9c4.686 4.686 12.284 4.686 16.971 0l209.414-209.414c4.686-4.686 4.686-12.284 0-16.971L41.678 38.101c-4.687-4.687-12.285-4.687-16.971 0z"/>
												</svg> 
									          </span>
									          <span class="js-accordion-toggle-active" style="display:none;">
									            <svg class="icon-inline icon-lg mr-2"xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
													<path d="M441.9 167.3l-19.8-19.8c-4.7-4.7-12.3-4.7-17 0L224 328.2 42.9 147.5c-4.7-4.7-12.3-4.7-17 0L6.1 167.3c-4.7 4.7-4.7 12.3 0 17l209.4 209.4c4.7 4.7 12.3 4.7 17 0l209.4-209.4c4.7-4.7 4.7-12.3 0-17z"/>
												</svg>
									          </span>
									        </div>
									      `;
									
									      const content = document.createElement('div');
									      content.className = 'js-accordion-content w-100';
									      content.style.display = 'none';
									
									      // Items
									      suc.forEach(l => {
									        const d = createBranchCard(l);
									        // click en item → centrar y resaltar
									        d.addEventListener('click', () => {
									          centerAndMaybePopup(l.lat, l.lng, true);
									          highlightBranch(l);
									        });
									        content.appendChild(d);
									      });
									
									      wrapper.appendChild(toggle);
									      wrapper.appendChild(content);
									      cont.appendChild(wrapper);
									    });
									  }
									
									  // 6) Marcadores
									  function buildMarkers(list) {
									    // limpiar viejos
									    allMarkers.forEach(m => map.removeLayer(m));
									    markerById.clear();
									    allMarkers = [];
									
									    list.forEach(l => {
									      const marker = L.marker([l.lat, l.lng]).addTo(map);
									     
									      marker.bindPopup(`<b>${l.nombre}</b><br>${l.direccion}<b>
									       <i class="ri-whatsapp-fill pop-wa"></i></b>`);
									      marker.on('click', () => {
									        centerAndMaybePopup(l.lat, l.lng, true);
									        highlightBranch(l);
									      });
									      markerById.set(l.id, marker);
									      allMarkers.push(marker);
									    });
									  }
									
									
									  // 7) Init
									  document.addEventListener('DOMContentLoaded', function(){
									    const grupos = groupByLocation(locales);
									    renderAccordion(grupos);
									    buildMarkers(locales);
										
									    // centrar inicialmente al primer local (si existe)
									    const first = locales[0];
									    if (first) centerAndMaybePopup(first.lat, first.lng, false);
									  
									    const accordionToggles = document.querySelectorAll('.branch-toggle');
									    accordionToggles.forEach(t => {
									      t.addEventListener('click', e => {
									        accordionToggles.forEach(t => {  
									          if(t !== e.currentTarget){ 
									            let inactiveIcon = t.querySelector('.js-accordion-toggle-inactive');
									            let activeIcon = t.querySelector('.js-accordion-toggle-active');
									            let accordionContent = t.parentNode.querySelector('.js-accordion-content');
									            accordionContent.style.display = 'none';
									            activeIcon.style.display = 'none';
									            inactiveIcon.style.display = 'inline';
									          }
									        }); 
									      });
									    });
									  });
									
									</script>

</div>
