{#/*============================================================================
style.scss.tpl

    -This file contains all the theme styles related to settings defined by user from config/settings.txt
    -Rest of styling can be found in:
      --static/css/style-async.css.tpl --> For non critical styles witch will be loaded asynchronously
      --static/css/style-critical.tpl --> For critical CSS rendered inline before the rest of the site

==============================================================================*/#}

{# /*============================================================================
  Table of Contents

  #Colors and fonts
    // Colors
    // Font families
    // SVG Icons
    // Texts
    // Backgrounds
  #Components
    // Margin and padding
    // Mixins
    // Animations
    // Functions
    // Wrappers
    // Placeholders
    // Dividers
    // Breadcrumbs
    // Headings
    // Buttons
    // Links
    // Chips
    // Progress bar
    // Modals
    // Forms
    // Tabs
    // Cards
    // Panels
    // Pills
    // Preloaders
    // Banners
    // Sliders
    // Tables
    // Cards
  #Home page
    // Instafeed
    // Video
  #Product grid
    // Grid item
    // Labels
    // Filters
  #Product detail
    // Image
    // Form and info
  #Contact page
    // Data contact
  #Account page
    // Order items
  #Header and nav
    // Ad Bar
    // Header
    // Search
  #Footer
  #Media queries
    // Forms

==============================================================================*/ #}

{#/*============================================================================
  #Colors and fonts
==============================================================================*/#}
	
{# /* // Colors */ #}

$primary-color: {{ settings.primary_color }};
$main-foreground: {{ settings.text_color }};
$main-background: {{ settings.background_color }};
$accent-color: {{ settings.accent_color }};

{# /* // Font families */ #}

$heading-font: {{ settings.font_headings | raw }};
$body-font: {{ settings.font_rest | raw }};

{# /* // SVG Icons */ #}

.svg-icon-primary{
  fill: $primary-color;
}
.svg-icon-text{
  fill: $main-foreground;
}
.svg-icon-accent{
  fill: $accent-color;
}
.svg-icon-invert{
  fill: $main-background;
}

{# /* // Texts */ #}

.text-primary {
  color: $primary-color;
}

.text-secondary {
  color: $main-background;
}

.text-accent,
.cart-installments.installment-no-interest {
  color: $accent-color;
}

{# /* // Backgrounds */ #}

.background-primary {
  background-color: $primary-color;
}

{#/*============================================================================
  #Components
==============================================================================*/#}

{# /* // Margin and padding */ #}

%section-margin {
  margin-bottom: 50px;
}
%element-margin {
  margin-bottom: 20px;
}
%element-margin-half {
  margin-bottom: 10px;
}

{# /* // Mixins */ #}

@mixin text-decoration-none(){
  text-decoration: none;
  outline: 0;
  &:hover,
  &:focus{
    text-decoration: none;
    outline: 0;
  }
}

@mixin no-wrap(){
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	font-weight: normal;
}

@mixin drop-shadow(){
	-moz-box-shadow: 0 0 3px #ccc;
	-webkit-box-shadow: 0 0 3px #ccc;
	box-shadow: 0 0 3px #ccc;
}

{# This mixin adds browser prefixes to a CSS property #}

@mixin prefix($property, $value, $prefixes: ()) {
	@each $prefix in $prefixes {
    	#{'-' + $prefix + '-' + $property}: $value;
	}
   	#{$property}: $value;
}

{# /* // Animations */ #}

%simplefade {
  transition: all 0.5s ease;
}

{# /* // Functions */ #}

@function set-foreground-color($bg-color, $foreground-color) {
  @if (lightness($bg-color) > 50) {
    @return $foreground-color; // Lighter background, return dark color
  } @else {
    @return lighten($foreground-color, 15%); // Darker background, return light color
  }
}

@function set-foreground-color-invert($bg-color, $foreground-color) {
  @if (lightness($bg-color) > 50) {
    @return darken($foreground-color, 100%); // black foreground over white background
  } @else {
    @return lighten($foreground-color, 15%); // no dark foreground on dark background
  }
}

@function set-foreground-color-footer($bg-color, $foreground-color) {
  @if (lightness($bg-color) > 50) {
    @return $foreground-color; // Lighter background, return dark color
  } @else {
    @return lighten($foreground-color, 30%); // Darker background, return light color
  }
}

{# /* // Wrappers */ #}

%body-font {
  font-size: 12px;
}

body{
  color: $main-foreground;
  font-family: $body-font;
  background-color:$main-background;
  @extend %body-font;
}

.box{
  float: left;
  width: 100%;
  margin-bottom: 20px;
  padding:8px;
  border:1px solid rgba($main-foreground, .2);
}

{# /* // Placeholders */ #}

.placeholder-container{
  background-color:rgba($main-foreground, 0.1);
}
.placeholder-color{
  background-color:rgba($main-foreground, 0.07);
}
.placeholder-icon svg{
  fill:rgba($main-foreground, 0.2);
}
.placeholder-page{
  background: $main-foreground;
  &:hover,
  &.active{
      background: $primary-color;
      opacity: 0.8;
  }
}
.placeholder-shine,
.placeholder-fade{
  background-color:rgba($main-foreground, 0.2);
}

.placeholder-overlay {
  background-color:rgba($main-foreground, 0.3);
  opacity: 0;
  &:hover,
  &:active,
  &:focus {
    opacity: 1;
  }
}

.placeholder-info {
  color: $main-foreground;
  fill: $main-foreground;
  background-color: $main-background;
  box-shadow: 0 1px 3px rgba(0,0,0,0.5);
}

.spinner-ellipsis .point {
  background-color: rgba($main-foreground, 0.2);
}

{# /* // Dividers */ #}

.divider{
  margin-top: 20px;
  margin-bottom: 20px;
  clear: both;
  border-bottom: 1px solid rgba($main-foreground, .1);
}

{# /* // Breadcrumbs */ #}

.breadcrumbs {
  @extend %element-margin-half;
}

{# /* Headings */ #}

h1,.h1,
h2,.h2,
h3,.h3,
h4,.h4,
h5,.h5,
h6,.h6,
.textbanner-title, .item-name, .footer-column-title {
  margin-top: 0;
  font-family: $heading-font;
}

.page-header {
  @extend %element-margin;
  h1, .h1{
    margin-bottom: 0;
  }
}

{# /* // Buttons */ #}

.btn{
  text-decoration: none;
  text-align: center;
  border: 0;
  cursor: pointer;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  text-transform: uppercase;
  background: none;
  @include prefix(transition, all 0.4s ease, webkit ms moz o);
  &:hover,
  &:focus{
    outline: 0;
    opacity: 0.8;
  }
  &[disabled],
  &.disabled,
  &[disabled]:hover,
  &.disabled:hover,{
    opacity: 0.5;
    cursor: not-allowed;
    outline: 0;
  }
  &-default{
    padding: 10px 15px; 
    background-color: rgba($main-foreground, .2);
    color: $main-foreground;
    fill: $main-foreground;
    font-weight: bold;
  }
  &-primary{
    padding: 15px;
    background-color: #000;
    color: #fff;
    fill: #fff;
    letter-spacing: 4px;
    @extend %body-font;
    &:hover{
      color: #fff;
      fill: #fff;
      opacity:0.8;
    }
  }
  &-secondary{
    padding: 10px 15px; 
    background-color: $main-background;
    color: $main-foreground;
    fill: $main-foreground;
    border: 1px solid $main-foreground;
  }
  &-variant{
    display: inline-block;
    font-size: 14px !important;
    
    min-width: 24px;
    min-height: 24px;
    margin: 0 10px 10px 0;
    border: 1px solid rgba($main-foreground, .3);
    color: rgba($main-foreground, .3);
    border-radius: 2px;
    vertical-align: top;
    &-content{
      display: block;
      min-width: 12px;
      min-height: 12px;
      margin: 5px;
      line-height: 12px;
    }
    &.selected {
      color: $main-foreground;
      border: 1px solid rgba($main-foreground, .8);
    }
    &-no-stock {
      position: relative;
      background: transparent;
      color: rgba($main-foreground, 0.5);
      overflow: hidden;
      &:after {
        position: absolute;
        top: 0;
        left: 0;
        z-index: 9;
        width: 100%;
        height: 100%;
        background: linear-gradient(to top left,transparent 49%,rgba($main-foreground, 0.5) ,transparent 52%);
        content:'';
      }

      &.selected:after {
        background: linear-gradient(to top left,transparent 49%,$main-foreground ,transparent 52%);
      }

      &.btn-variant-color:after {
        background: linear-gradient(-45deg,rgba($main-background, 0.3) calc(50% - .7px),rgba($main-foreground, 0.5) calc(50% - .7px),rgba($main-foreground, 0.5) 50%,rgba($main-foreground, 0.5) calc(50% + .7px),rgba($main-background, 0.3) calc(50% + .7px));
      }

      &.btn-variant-color.selected:after {
        background: linear-gradient(-45deg,rgba($main-background, 0.3) calc(50% - .7px),$main-foreground calc(50% - .7px),$main-foreground 50%,$main-foreground calc(50% + .7px),rgba($main-background, 0.3) calc(50% + .7px));
      }
    }
  }

  .btn-variant-content{
    font-size: 12px !important;
  }
  &-block{
    float: left;
    width: 100%;
  }
  &-medium{
    padding: 12px;
  }
  &-small{
    display: inline-block;
    padding: 10px;
    font-size: 10px;
    letter-spacing: 2px;
  }
  &-line{
    padding: 10px 0;
    color: $main-background;
    fill: $main-background;
    letter-spacing: 4px;
    @extend %body-font;
    border-bottom: 2px solid;
  }
  &-circle{
    height: 32px;
    border-radius: 50%;
  }
  &-facebook{
    background-color: #1977f2;
    .svg-fb-icon {
      fill: #fff;
    }
  }
}

button{
  color: #000 !important;
  font-family: 'Oswald', sans-serif !important;
  font-weight: 600 !important;
  font-size: 16px !important;
  cursor: pointer;
  &:focus{
    outline: 0;
    opacity: 0.8;
  }
}

{# /* // Texts */ #}

.text-primary {
  color: $primary-color;
}

.text-secondary {
  color: $main-background;
}

{# /* // Links */ #}

a {
  color: $main-foreground;
  fill: $main-foreground;
  @include prefix(transition, all 0.4s ease, webkit ms moz o);
  &:hover,
  &:focus{
    color: rgba($main-foreground, .5);
    fill: rgba($main-foreground, .5);
  }
}

.link-contrast {
  color: $main-background;
  fill: $main-background;
  &:hover,
  &:focus{
    color: rgba($main-background, .8);
    fill: rgba($main-background, .8);
  }
}

.btn-link{
  color: $primary-color;
  fill: $primary-color;
  text-transform: uppercase;
  font-family: 'Oswald', sans-serif;
  font-weight: 600;
  cursor: pointer;
  &:hover,
  &:focus{
    color: rgba($primary-color, .5);
    fill: rgba($primary-color, .5);
  }
}

{# /* // Chips */ #}

.chip {
  color: $main-foreground;
  background: rgba($main-foreground,0.1);
  border: 0;

  &-remove-icon {
    fill: $main-foreground;
  }
}

/* // Progress bar */

.bar-progress {
  background: rgba($accent-color, 0.1);
  &-active {
    background: $accent-color;
  }
}

{# /* // Modals */ #}

.modal{
  color: $main-foreground;
  background-color:$main-background;
}

{# /* // Forms */ #}

input,
textarea {
  font-family: $body-font;
  color: #000;
}

.form-control {
  display: block;
  padding: 8px;
  width: 100%;
  font-size: 16px; /* Hack to avoid autozoom on IOS */
  border: 0;
  border-bottom: 1px solid rgba($main-foreground, .5);
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  color: #000;
  background-color: $main-background;
  &:focus{
    outline: 0;
  }
  &-inline{
    display: inline;
  }
}

.form-control::-webkit-input-placeholder { 
  color: rgba(#000, .3);
}
.form-control:-moz-placeholder {
  color: rgba(#000, .3);
}
.form-control::-moz-placeholder {
  color: rgba(#000, .3);
}
.form-control:-ms-input-placeholder {
  color: rgba(#000, .3);
}

.form-control.alert-danger {
  background-color: $main-background;
  border-bottom: 1px solid #cc4845;
}

.form-select{
  display: block;
  padding: 10px 0;
  width: 100%;
  font-size: 16px; /* Hack to avoid autozoom on IOS */
  border: 0;
  border-bottom: 1px solid rgba($main-foreground, .5);
  border-radius: 0;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  color: #000;
  background-color: $main-background;
  @extend %body-font;
  &-icon{
    background: $main-background;
  }
}

.input-clear-content:before {
  content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" fill="{{ settings.primary_color |replace("#","%23") }}"><path d="M207.6 256l107.72-107.72c6.23-6.23 6.23-16.34 0-22.58l-25.03-25.03c-6.23-6.23-16.34-6.23-22.58 0L160 208.4 52.28 100.68c-6.23-6.23-16.34-6.23-22.58 0L4.68 125.7c-6.23 6.23-6.23 16.34 0 22.58L112.4 256 4.68 363.72c-6.23 6.23-6.23 16.34 0 22.58l25.03 25.03c6.23 6.23 16.34 6.23 22.58 0L160 303.6l107.72 107.72c6.23 6.23 16.34 6.23 22.58 0l25.03-25.03c6.23-6.23 6.23-16.34 0-22.58L207.6 256z"/></svg>');
}

.radio-button-container{
  .radio-button {
    &-content{
      fill: $main-foreground;
      border-bottom: 1px solid rgba($main-foreground, .1);
    }
    input[type="radio"]{
      &:checked {
        + .radio-button-content{
          color: $primary-color;
          fill: $primary-color;
          outline: 2px solid $primary-color;
          outline-offset: -1px;
          .unchecked{
            border: 2px solid $primary-color;
          }
        }
        .shipping-method-price{
          color: $primary-color;
        }
      }

      & +  .radio-button-content .unchecked{
        border: 2px solid $main-foreground;
      }
      & +  .radio-button-content .checked{
        background-color: $primary-color;
      }
    }
  }
  .shipping-extra-options .radio-button-item:first-child {
    .radio-button-content{
      border-top: 1px solid rgba($main-foreground, .1);
    }
    input[type="radio"]:checked .radio-button-content{
      border: 2px solid $primary-color;
    }
  }
  .radio-button-item:last-of-type .radio-button-content{
    border-bottom: 0;
  }
}

.checkbox-container{
  .checkbox {
    color: $main-foreground;
    &-color {
      border: 1px solid rgba($main-foreground,.1);
    }
    &-icon {
      background: $main-background;
      border: 1px solid $main-foreground;
      &:after {
        border: solid $main-foreground;
        border-width: 0 2px 2px 0;
      }
    }
    &:hover {
      color: rgba($main-foreground,.8);
    }
  }
}

input::-webkit-inner-spin-button,
input::-webkit-outer-spin-button{
  margin: 0;
  -webkit-appearance: none;
}

input[type=number] {
  -moz-appearance:textfield;
}

{# /* Lists */ #}

.list-readonly {
  .list-item {
    border-bottom: 1px solid rgba($main-foreground, .1);
    .radio-button-content{
      border-bottom: none;
    }
    &:only-child,
    &:last-of-type {
      border-bottom: 0;
    }
  }
  .shipping-extra-options .list-item:first-child {
    border-top: 1px solid rgba($main-foreground, .1);
    .radio-button-content{
      border-top: none;
    }
  }
  .list-item:last-of-type .radio-button-content{
    border-bottom: none;
  } 
}

{# /* // Alerts and notifications */ #}

.alert{
  &-danger,
  &-error{
    color: set-foreground-color-invert($main-background, #cc4845);
    border-color: rgba(set-foreground-color($main-background, #cc4845),.1);
    background-color: rgba(#cc4845, .1); 
  }
  &-warning{
    color: set-foreground-color-invert($main-background, #c09853);
    border-color: rgba(set-foreground-color($main-background, #c09853),.1);
    background-color: rgba(#c09853, .1); 
  }
  &-info{
    color: $main-foreground;
    border-color: rgba($main-foreground, .6);
    background-color: rgba($main-foreground, .02); 
  }
  &-success{
    color: set-foreground-color-invert($main-background, #3caf65);
    border-color: rgba(set-foreground-color($main-background, #3caf65),.1);
    background-color: rgba(#3caf65, .1); 
  }
  &-primary {
    border-color: rgba($primary-color, .1);
    color: $primary-color;
    background-color: rgba($primary-color, .05); 
  }
}

.notification-primary{
  color: $primary-color;
  fill: $primary-color;
  border-color: rgba($primary-color, .2);
  background-color: rgba($primary-color, .1);
}

.notification-floating .notification-primary{
  background-color: $main-background;
  border: 1px solid rgba($main-foreground, .14);
}

.notification-secondary {
  padding: 12px 0;
  background: darken($main-background, 3%);
  color: rgba($main-foreground, .8);
  border-bottom: 1px solid rgba($main-foreground, .1);
}

.notification-with-arrow:after,
.notification-with-arrow:before{
  position: absolute;
  width: 0;
  height: 0;
  display: block;
  border-style: solid;
  @include prefix(transform, rotate(-90deg), webkit ms moz o);
  content: '';
}
.notification-with-arrow:after {
  top: -17px;
  right: 14px;
  border-color: transparent transparent transparent $main-background;
  border-width: 9px;
}
.notification-with-arrow:before {
  top: -18px;
  right: 14px;
  border-color: transparent transparent transparent rgba($main-foreground, .14);
  border-width: 9px;
}

{# /* // Banners */ #}

.textbanner-image-empty:after {
  background-color: rgba($main-foreground, 0.3);
}

{# /* // Informative banners */ #}

.service-icon {
  fill: var(--accent-color);
}

{# /* // Tables */ #}

.table{
  background-color: $main-background;
  color: $main-foreground;
  tbody{
    tr:nth-child(odd){
      background-color: rgba($main-foreground, .05);
    }
    &.table-body-inverted{
      tr:nth-child(even){
        background-color: rgba($main-foreground, .05);
      }
      tr:nth-child(odd){
        background-color: $main-background;
      }
    }
  }
  th{
    padding: 8px;
    text-align: left;
  }
}

{# /* // Tabs */ #}

.tab-group{
  border-bottom: 1px solid rgba($main-foreground, .1);
  .tab{
    &-link{
      color: $main-foreground;
    }
    &.active{
      .tab-link{
        border-bottom: 2px solid rgba($primary-color, .5);
        color: $primary-color;
      }
    }
  }
}

{# /* Cards */ #}

.card {
  background-color: $main-background;
  border: 1px solid rgba($main-foreground, .4);
}

{# /* // Sliders */ #}

.swiper-pagination-bullet-active {
  background-color: $main-foreground;
}

.swiper-text {
  opacity: 0;
  top: 60%;
}
.swiper-title {
  font-family: $heading-font;
}
.swiper-slide-active .swiper-text {
  opacity: 1;
  top: 50%;
}

.swiper-dark {
  color: $main-foreground;
  .swiper-btn {
    color: $main-background;
    background-color: $main-foreground;
  }
}

.swiper-light {
  color: $main-background;
  .swiper-btn {
    color: $main-foreground;
    background-color: $main-background;
  }
}

{#/*============================================================================
  #Home Page
==============================================================================*/#}

{# /* // Home slider */ #}

{# /* // Video */ #}

.section-video-home {
  @extend %element-margin;
}

.embed-responsive {
  background: $main-foreground;
}

{# /* // Instafeed */ #}

.section-instafeed-home {
  @extend %element-margin;
}

.instafeed-title {
  display: block;
  @extend %element-margin;
  color: $main-foreground;
}

.instafeed-info {
  color: $main-background;
  fill: $main-background;
  background: rgba($main-foreground, .6);
}

{# /* // Featured products */ #}

.section-featured-home {
  @extend %element-margin;
}


{#/*============================================================================
  #Product grid
==============================================================================*/#}

{# /* // Grid item */ #}

.item-link {
  color: $main-foreground;
  &:hover{
    color: #000 !important;
    opacity: 0.9;
  }
  &:focus{
    color: #000 !important;
    opacity: 0.9;
  }
}

.item-colors {
  &-bullet {
    color: $main-foreground;
  }
  &-bullet-text {
    color: $main-background;
  }
}

{# /* // Labels */ #}

.label {
  background: darken($main-background, 5%);
  &.label-primary{
    background: $main-foreground;
    color: $main-background;
  }
  &.label-accent{
    background: $accent-color;
    color: $main-background;
  }
  &.label-promotion {
    background: var(--accent-color);
    color: $main-background;
  }
  &.label-free-shipping {
    background: var(--installment-color);
    color: $main-background;
  }
}

{# /* // Filters */ #}

.category-controls {
  background: $main-background;
  @extend %simplefade;
  &.is-sticky {
    border-bottom: 1px solid rgba($main-foreground, .1);
  }
}

.filters-overlay {
  background-color: rgba($main-background, .85);
}

{#/*============================================================================
  #Product detail
==============================================================================*/#}

{# /* // Image */ #}

.nube-slider-product {
  background: rgba($main-foreground, 0.04);
  @extend %element-margin;
}

.product-video-container {
  background-color: rgba($main-foreground, .07);
}

{# /* // Form and info */ #}
    
.social-share {
  @extend %element-margin;
  .social-share-button {
    color: $main-foreground;
  }
}

.product-description {
  @extend %section-margin;
}

{#/*============================================================================
  #Contact page
==============================================================================*/#}

{# /* // Data contact */ #}

.contact-item {
  @extend %element-margin;
}

.contact-link {
  color: $main-foreground;
}

{#/*============================================================================
  #Account page
==============================================================================*/#}

{# /* // Order item */ #}

.order-item {
  padding: 15px 0;
  border-bottom: 1px solid rgba($main-foreground, .08);
  &:first-child {
    border-top: 1px solid rgba($main-foreground, .08);
  }
}

{#/*============================================================================
  #Header and nav
==============================================================================*/#}

{# /* // Ad Bar */ #}

.section-advertising {
  background-color: $main-foreground;
  color: $main-background;
}

{# /* // Header */ #}

.head-light{
  background-color: $main-background;
  @extend %simplefade;
  .cart-widget-amount,
  .svg-icon-text,
  .logo-text {
    color: $main-foreground;
    fill: $main-foreground;
  }
}

.head-dark{
  background-color: $main-foreground;
  @extend %simplefade;
  .cart-widget-amount,
  .svg-icon-text,
  .logo-text {
    color: $main-background;
    fill: $main-background;
  }
}

.head-transparent{
  background-color: transparent;
}

.nav-account{
  background: $main-background;
  border-top: 1px solid rgba($main-foreground, .5);
}

.desktop-dropdown-small {
  background-color: $main-background;
}

{# /* // Search */ #}

.search-suggest-item {
  border-bottom: 1px solid rgba($main-foreground, .1);
}

{#/*============================================================================
  #Footer
==============================================================================*/#}

.section-footer {
  @extend %section-margin;
}
.element-footer {
  @extend %element-margin;
}

.powered-by-logo svg {
  fill: $main-foreground;
}

{#/*============================================================================
  #Media queries
==============================================================================*/ #}


{# /* // Min width 768px */ #}

@media (min-width: 768px) {

  {# /* Forms */ #}

  .form-control {
    padding: 10px 8px;
    font-size: 16px;
  }

  .form-select {
    font-size: 14px;
  }

}

{# // 1) Mapa de colores (nombre => lista de hexas) #}
$variant-colors: (
  "SURTIDO": (#000000, #FFFFFF, #828282),
  "NEGRO": (#000000),
  "CELESTE": (#bceeff),
  "LILA": (#9470c4),
  "PISTACCIO": (#93c572),
  "ROSA": (#ffc0cb),
  "BLANCO": (#FFFFFF),
  "SOFIA": (#E5D3BF),
  "BORDO": (#800040),
  "GRIS": (#9b9b9b),
  "MARINO": (#0d0d73),
  "ANIMAL PRINT": (#984A18),
  "DEGRADE AZUL": (#1919e6),
  "DEGRADE TIERRA": (#4e3b31),
  "CHOCOLATE": (#45322e),
  "CHERRY": (#790604),
  "OLIVA": (#86895d),
  "AZUL/CRUDO": (#1919e6, #C2B280),
  "PETROLEO/CRUDO": (#084d6e, #C2B280),
  "NARANJA": (#ff8000),
  "VISON": (#9c9695),
  "FUCSIA OBISPO": (#a31247),
  "TURQUESA INTENSO": (#30D5C8),
  "LEMON": (#bfff00),
  "ROSE": (#ec53a0),
  "GRIS CLARO": (#c3c3c3),
  "VIOLETA": (#4a1d8d),
  "FUCSIA": (#e30052),
  "VERDE": (#008f39),
  "ROJO": (#FF0000),
  "BLANCO/NEGRO/HUESO": (#FFFFFF, #000000, #f1e1b0),
  "GRIS MELANGE": (#CCCAC9),
  "MIEL": (#a98307),
  "AZUL MARINO": (#000080),
  "VERDE PETROLEO": (#005F6A),
  "MELANGE": (#CCCAC9),
  "ROSA VIEJO": (#b47b77),
  "VERDE MILITAR": (#4B5320),
  "AERO": (#416aa2),
  "CORAL": (#ff7f50),
  "ESMERALDA": (#009975),
  "ROSA CHICLE": (#FF69AF),
  "TURQUESA": (#30D5C8),
  "AZUL": (#1919e6),
  "MAIZ": (#e4a010),
  "ROSA TERRA": (#af4c4d),
  "AZUL NIEBLA": (#5984B1),
  "AZUL/MADEIRA": (#1919e6, #EED09D),
  "PINK": (#ec53a0),
  "MALVA": (#b4aabc),
  "Africa": (#ff8000),
  "BLACK": (#000000),
  "GOLD": (#b89e14),
  "MORA": (#591861),
  "WATER": (#d4f1f9),
  "FLAMINGO": (#FC8EAC),
  "FRANCIA": (#00615F),
  "ORQUIDEA": (#da70d6),
  "ARMY": (#4B5320),
  "OFF WHITE": (#FAF9F6),
  "ORANGE": (#ff8000),
  "CAMELIA": (#964B00),
  "FLUO": (#E2F705),
  "CAMEL": (#bf8a3d),
  "LILA LAVANDA": (#9470c4),
  "AVELLANA": (#CFB095),
  "VERDE NEGRO": (#013220),
  "AMARILLO": (#ffff00),
  "FRESA": (#FC5A8D),
  "VERDE AZULADO": (#1f3a3d),
  "BLANCO/NEGRO/NUDE": (#FFFFFF, #000000, #ebc8b2),
  "ALMENDRA": (#f6e9d3),
  "NUDE": (#ebc8b2),
  "PETROLEO": (#084d6e),
  "CEREZA": (#790604),
  "LIMON": (#bfff00),
  "SALMON": (#FA8072),
  "HUESO": (#f1e1b0),
  "Langosta": (#ff5a36),
  "LANGOSTINO": (#ff5a36),
  "AZUL NOCHE": (#252850),
  "GRIS OSCURO": (#686868),
  "NEGRO/LIMA": (#000000, #32cd32),
  "NEGRO/FUCSIA": (#000000, #e30052),
  "BORRAVINO": (#800020),
  "VERDE INGLES": (#004225),
  "GRIS TOPO": (#483C32),
  "AZUL GRIS": (#6699CC),
  "GRIS/BLANCO": (#9b9b9b, #FFFFFF),
  "negro borravino": (#000000),
  "NEGRO/TURQUESA": (#000000, #30D5C8),
  "FUCSIA/NEGRO": (#e30052, #000000),
  "ROSA/BLANCO": (#ffc0cb, #FFFFFF),
  "UNICO": (#000000, #FFFFFF, #828282),
  "MILITAR": (#4B5320),
  "TERRA": (#4e3b31),
  "TOPO": (#483C32),
  "ARENA": (#f5deb3),
  "AZULINO": (#1919e6),
  "NATURAL": (#E5D3BF),
  "TOSTADO": (#D2B48C),
  "LAVANDA": (#e6e6fa),
  "Blanco/ Negro/ Nude": (#FFFFFF, #000000, #ebc8b2),
  "BLANCO/NEGRO": (#FFFFFF, #000000),
  "AQUA": (#00ffff),
  "ESTAMPADO": (#000000, #FFFFFF, #828282),
  "ANIMAL FUCSIA": (#e30052),
  "ANIMAL VISON": (#9c9695),
  "HUESO LIBERTY": (#f1e1b0),
  "FRUTILLA": (#FF0000),
  "LIMA": (#32cd32),
  "BLUE": (#1919e6),
  "MOSTAZA": (#FFDB58),
  "CIELO": (#B2FFFF),
  "COFFEE": (#a18262),
  "NEGRO CRUSH": (#000000),
  "NEGRO LISO": (#000000),
  "Hueso Bordo": (#f1e1b0),
  "Hueso verde": (#f1e1b0),
  "NEGRO LETRAS": (#000000),
  "MARRON": (#964B00),
  "ZEPPELIN": (#000000, #FFFFFF, #828282),
  "NUDE/VERDE": (#ebc8b2, #ebc8b2),
  "Blanco/Naranja": (#FFFFFF, #ff8000),
  "NEGRO/BORDO": (#000000, #800040),
  "NEGRO/ROSA": (#000000, #ffc0cb),
  "ROSA VINTAGE": (#ffc0cb),
  "fucsia fluo": (#e30052),
  "GRIS HUMO": (#848484),
  "VERDE/NUDE": (#ebc8b2, #ebc8b2),
  "AMARILLO FLUO": (#ffff00),
  "PIEL": (#F5F5DC),
  "CAMUFLADO": (#4B5320),
  "FLORES": (#ffc0cb),
  "NEGRO/NUDE": (#000000, #ebc8b2),
  "CEBRA": (#000000, #FFFFFF),
  "AMARILLO FLUO (AFLU)": (#ffff00),
  "AMARILLO FLUO (AMFL)": (#ffff00),
  "BLANCO/FRESA": (#FFFFFF, #FC5A8D),
  "AZUL CIELO": (#2271b3),
  "CARAMELO": (#f4a460),
  "BEIGE": (#f5f5dc),
  "ACQUA CLARO": (#00ffff),
  "VERDE PISTACHO": (#93c572),
  "NEG/AZUMR": (#000000),
  "AZUL/NEGRO": (#1919e6, #000000),
  "GRIS MELANGE/BLANCO": (#CCCAC9, #FFFFFF),
  "GRIS MELANGE/NEGRO": (#CCCAC9, #000000),
  "SOFT LIMA": (#32cd32),
  "NOUGAT": (#E5D3BF),
  "LAVANDA MELANGE": (#e6e6fa),
  "VERDE ALBA MELANGE": (#a6a656),
  "VERDE MENTA": (#3EB489),
  "ACUA": (#00ffff),
  "FRAMBUESA": (#E30B5D),
  "GRIS ESPLENDOR": (#9b9b9b),
  "CELESTE EDEN": (#bceeff),
  "FUCSIA POP": (#e30052),
  "DAMASCO": (#FFE5B4),
  "ROSA ORQUIDEA": (#ffc0cb),
  "ROSA PALIDO": (#FADADD),
  "LAVANDA OSCURO": (#d2bbe3),
  "Celeste Aero": (#4682b4),
  "MENTA VINTAGE": (#3EB489),
  "AZUL FRANCIA": (#00615F),
  "UVA": (#572364),
  "PISTACHO": (#93c572),
  "CELESTE CIELO": (#bceeff),
  "VERDE JADE": (#00BB77),
  "VERDE MUSGO": (#8A9A5B),
  "LADRILLO": (#BC4A3C),
  "OCEANO": (#1d334a),
  "PERLA": (#eae0c8),
  "MORADO": (#572364),
  "HOJAS": (#8A9A5B),
  "OXIDO": (#DA2C43),
  "NUDE/CORAL": (#ebc8b2),
  "BLANCO/LILA": (#FFFFFF, #9470c4),
  "BLANCO/ROSA": (#FFFFFF, #ffc0cb),
  "LILA/NEGRO": (#9470c4, #000000),
  "AMARILLO/NEGRO": (#ffff00, #000000),
  "ROSA/FUCSIA": (#ffc0cb, #e30052),
  "AZUL MARINO/BLANCO": (#000080, #FFFFFF),
  "GRIS/NEGRO": (#9b9b9b, #000000),
  "NEGRO/BLANCO": (#000000, #FFFFFF),
  "BLANCO/AZUL MARINO": (#FFFFFF, #000080),
  "GRIS/ROJO": (#9b9b9b, #FF0000),
  "NEGRO/ROJO": (#000000, #FF0000),
  "ROJO/AZUL MARINO": (#FF0000, #000080),
  "VERDE AQUA": (#00FFFF),
  "NEGRO/BLANCO (NBL)": (#000000, #FFFFFF),
  "NEGRO/VIOLETA": (#000000, #4a1d8d),
  "NEGRO/VERDE": (#000000, #ebc8b2),
  "NEGRO/CELESTE": (#000000, #bceeff),
  "NEGRO/BLANCO (NGBO)": (#000000, #FFFFFF),
  "NEGRO/AMARILLO": (#000000, #ffff00),
  "NEGRO/NARANJA": (#000000, #ff8000),
  "VERDE ACUA": (#00FFFF),
  "NARANJA FLUO": (#ff8000),
  "AZUL MARINO/ROJO": (#000080, #FF0000),
  "BLANCO/GRIS": (#FFFFFF, #9b9b9b),
  "CIRUELA": (#8E4585),
  "VERDE OLIVA": (#808000),
  "MENTA": (#3EB489),
  "ROSA DIOR": (#E30052),
  "ROSA PINK": (#ffc0cb),
  "NEGRO/AZUL": (#000000, #1919e6),
  "PURPURA": (#7d2181),
  "NEGRO/PLATA": (#000000, #c0c0c0),
  "cerezos rosa": (#ffc0cb),
  "REPTIL": (#5e582b),
  "BLANCO ESTAMPADO": (#FFFFFF),
  "NEGRO ESTAMPADO": (#000000),
  "ROSA ESTAMPADO": (#ffc0cb),
  "moneda hueso": (#f1e1b0),
  "noche": (#000000),
  "DENIM": (#000080),
  "CAMUFLADO NEGRO": (#000000),
  "CAMUFLADO VERDE": (#4B5320),
  "Blanco/Negro/Rojo": (#FFFFFF, #000000, #FF0000),
  "BLANCO NEGRO ALMENDRA": (#FFFFFF),
  "BLANCO NEGRO MELANGE": (#FFFFFF),
  "MELANGE/NEGRO/BLANCO": (#CCCAC9, #000000, #FFFFFF),
  "BLANCO/ ROJO": (#FFFFFF, #FF0000),
  "FUCSIA/ BLANCO": (#e30052, #FFFFFF),
  "fuxia/blanco": (#e30052, #FFFFFF),
  "BLANCO/AQUA": (#FFFFFF, #00ffff),
  "CANDY": (#ffbcd9),
  "VINO": (#722F37),
  "RUBI": (#E0115F),
  "BLANCO/SOFIA": (#FFFFFF, #E5D3BF),
  "NEGRO/SOFIA": (#000000, #E5D3BF),
  "NEGRO/TERRA": (#000000, #4e3b31),
  "CHAMPAGNE": (#F7E7CE),
  "ROJO SCARLET": (#FF2400),
  "VERDE GALAPAGOS": (#ebc8b2),
  "CEIBO": (#B46647),
  "ROSA PERLA": (#ffc0cb),
  "ESTAMPADO CAMEL": (#bf8a3d),
  "ESTAMPADO NEGRO": (#000000),
  "TIBURON": (#92959d),
  "ARCILLA": (#d5c2b7),
  "AZUL OCEANO": (#1d334a),
  "ESTAMPADO NEGRO GRIS": (#9b9b9b),
  "PETALO": (#ffc0cb),
  "SALMON/APRICOT": (#FA8072),
  "SALMON AMBAR": (#FA8072),
  "BLUSH": (#1919e6),
  "CRUDO": (#C2B280),
  "ROSA PALO": (#ffc0cb),
  "ANIMAL PRINT/NEGRO": (#984A18, #000000),
  "MADEIRA": (#EED09D),
  "BLANCO/AZUL": (#FFFFFF, #1919e6),
  "BLANCO/NUDE": (#FFFFFF, #ebc8b2),
  "VERDE/TURQUESA": (#ebc8b2, #30D5C8),
  "ROJO/SOFIA": (#FF0000, #E5D3BF),
  "NEGRO MOSTAZA/NEGRO GRIS": (#000000),
  "NUDE/NATURAL": (#ebc8b2, #E5D3BF),
  "NUDE/SOFIA": (#ebc8b2, #E5D3BF),
  "BLANCO/CAMEL": (#FFFFFF, #bf8a3d),
  "BLANCO/CRUDO": (#FFFFFF, #C2B280),
  "BLANCO/CRUDO/SOFIA": (#FFFFFF, #C2B280, #E5D3BF),
  "PINO": (#2c5545),
  "PLATA": (#c0c0c0),
  "BEIGE HUMO": (#f5f5dc),
  "MANGO": (#ffcd48),
  "VERDE LAUREL": (#808000),
  "AMARILLO CITRUS": (#ffff00),
  "GRAFITO": (#1c1c1c),
  "HABANO": (#482c1e),
  "MALBEC": (#722F37),
  "GRANATE ESP": (#ff0000)
);


{# // 2) Función: gradiente hard-stop equitativo a 135° #}
@function gradient-hard-stop($colors, $angle: 135deg) {
  $n: length($colors);
  @if $n <= 1 {
    @return nth($colors, 1);
  }
  $step: 100% / $n;
  $stops: ();
  @for $i from 1 through $n {
    $c: nth($colors, $i);
    $start: ($i - 1) * $step;
    $end: $i * $step;
    // dos paradas por color (hard stop)
    $stops: append($stops, $c $start, comma);
    $stops: append($stops, $c $end, comma);
  }
  @return linear-gradient($angle, $stops);
}

{# // 3) Mixin: aplica fondo según el nombre del color en un atributo (default: data-color) #}
@mixin item-color-variants($map: $variant-colors, $attr: data-option, $angle: 135deg) {
  .item-colors-bullet.js-color-variant {
    @each $name, $colors in $map {
      &[#{$attr}="#{$name}"] {
        @if length($colors) == 1 {
          background: nth($colors, 1);
        } @else {
          background: gradient-hard-stop($colors, $angle);
        }
      }
    }
  }
}

{# /* 4) Usar el mixin */ #}
@include item-color-variants();

