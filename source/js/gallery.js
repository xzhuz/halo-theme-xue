var photo = {
    loadGallery: function () {
        if (document.getElementById('gallery-content')) {
            new Viewer(document.getElementById('gallery-content'), {
                toolbar: true,
            });
        }

        if (typeof ($.fn.justifiedGallery) === 'function') {
            if ($('.justified-gallery > p > .gallery-item').length) {
                $('.justified-gallery > p > .gallery-item').unwrap();
            }
            $('.justified-gallery').justifiedGallery({rowHeight: 230, margins: 4});
        }
    }
}

document.addEventListener('DOMContentLoaded', photo.loadGallery);