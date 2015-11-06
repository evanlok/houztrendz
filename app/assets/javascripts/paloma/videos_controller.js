var VideosController = Paloma.controller('Videos');

VideosController.prototype.show = function () {
  var params = this.params;
  var player = videojs('video', {
    fluid: true,
    customControlsOnMobile: true,
    plugins: {
      videoJsResolutionSwitcher: {
        default: 'low', // Default resolution [{Number}, 'low', 'high'],
        dynamicLabel: true // Display dynamic labels or gear symbol
      }
    }
  });

  // Message form AJAX
  $('.message-form').on('ajax:success', function (e, data) {
    $(this).find(':input').not(':input[type=submit]').val('');
    $(this).find('.alert-danger').addClass('hidden');
    $(this).find('.alert-success').removeClass('hidden');
  }).on('ajax:error', function (e, xhr) {
    var html = '';

    $.each(xhr.responseJSON.errors, function (index, errorMessage) {
      html += '<li>' + errorMessage + '</li>';
    });

    $(this).find('.alert-success').addClass('hidden');
    $(this).find('.alert-danger').removeClass('hidden').find('ul').html(html);
  })
};
