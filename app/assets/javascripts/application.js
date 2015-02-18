// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require jquery_nested_form
//= require jquery-ui
//= require foundation
//= require turbolinks


$(function () {
    $(document).foundation();
});

function presentationVisibilityUpdater() {
    var chosen = $(this).val();
    var panel = $(this).closest(".panel");

    hideAllFields(panel);

    if (chosen == "checkbox" || chosen == "radiobutton" || chosen == "dropdown") {
        showTextField(panel);
    } else if (chosen == "range") {
        showRangeField(panel);
    } else if (chosen == "file") {
        hideAllFields(panel);
        hideDefaultField(panel);
    } else if (chosen == "date") {
        hideAllFields(panel);
    }
}

$(document).ready(function () {
    $(".presentation").each(presentationVisibilityUpdater);
    $('body').on('change', '.presentation', presentationVisibilityUpdater);
});

$(document).on('nested:fieldAdded', function (event) {
    // Insert Attribute Name in created panel
    var panel = $("#field-wrapper .fields:last .input input:first");
    panel.val($("#attr-name").val());
    $("#attr-name").val("");
    $('#add-panel').show();
    presentationVisibilityUpdater.call($("#field-wrapper .fields:last .input .presentation"));
});

function showTextField(panel) {
    panel.find(".textfield").show();
    panel.find(".rangefield").hide();
}

function showRangeField(panel) {
    panel.find(".textfield").hide();
    panel.find(".rangefield").show();
}

function hideDefaultField(panel) {
    panel.find(".text").hide();
}

function hideAllFields(panel) {
    panel.find(".textfield").hide();
    panel.find(".rangefield").hide();
}

$(function () {
    $('.datepicker').datepicker({
        dateFormat: 'yy-mm-dd',
        constrainInput: true,
        showOn: 'both',
        buttonText: '<i class="fi-calendar"></i>'
    });
});