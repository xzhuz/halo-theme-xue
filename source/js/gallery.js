var cardViewer;
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
    },

    showPhotos: function () {
        $('div.gallery-cards').on('click', function () {
            var galleryArea = $('#galleryArea');
            var cards = $(this);
            var itemIndex = cards.attr('itemIndex');
            var galleryAreaIndex = galleryArea.attr('itemIndex');
            // 先删除
            galleryArea.remove();
            // 如果是重复点击当前元素, 直接返回
            if (itemIndex === galleryAreaIndex) {
                photo.restoreGalleryCard(galleryArea);
                return;
            }

            // 再添加
            photo.appendEle(this, itemIndex);

            var childCard = cards.children().children();
            galleryArea = $('#galleryArea');
            galleryArea.toggleClass('justified-gallery');
            // galleryArea.toggleClass('gallery-area-tog');

            galleryArea.append(childCard.clone());
            galleryArea.find('.content').each(function () {
                $(this).toggleClass('hidden');
            })

            if (typeof ($.fn.justifiedGallery) === 'function') {
                galleryArea.find('.gallery-item').each(function () {
                    $(this).unwrap();
                });
                galleryArea.justifiedGallery({
                    rowHeight: 230,
                    margins: 4,
                    cssAnimation: true,
                    imagesAnimationDuration: 1000,
                });
            }
            cardViewer = new Viewer(document.getElementById('galleryArea'), {
                toolbar: true,
            });
        });
    },

    // 添加元素
    appendEle: function (thisEle, itemIndex) {
        var galleryCards = $('#galleryCards');
        var cardLen = galleryCards.children().length;
        var cardsIndex = $('#galleryCards .gallery-cards').index(thisEle);

        var screenWidth = document.documentElement.clientWidth;
        var element;
        var left = '30%';
        if (screenWidth >= 1024) { //lg
            element = '<div class="gallery-area col-span-4 gallery-area-bg transition duration-500 ease-in-out" id="galleryArea" itemIndex=' + itemIndex + '></div>';
            photo.doAppendDiv(cardsIndex, cardLen, 4, element, thisEle);
            left = (cardsIndex + 1) % 4 * 18 + '%';
        } else if (screenWidth >= 768 && screenWidth < 1024) { //md
            element = '<div class="gallery-area col-span-3 gallery-area-bg transition duration-500 ease-in-out" id="galleryArea" itemIndex=' + itemIndex + '></div>';
            photo.doAppendDiv(cardsIndex, cardLen, 3, element, thisEle);
            // left = 3;
            left = (cardsIndex + 1) % 3 * 20 + '%';
        } else if (screenWidth >= 640 && screenWidth < 768) { // sm
            element = '<div class="gallery-area gallery-area-bg col-span-2 transition duration-500 ease-in-out" id="galleryArea" itemIndex=' + itemIndex + '></div>';
            if ((cardsIndex + 1) % 2 === 0) {
                $(thisEle).after(element);
            } else {
                $(thisEle).next().after(element);
            }
            left = (cardsIndex + 1) % 2 * 20 + '%';
            if (left === '0%') {
                left = '70%';
            }
        } else {  // xs
            element = '<div class="gallery-area gallery-area-bg transition duration-500 ease-in-out" id="galleryArea" itemIndex=' + itemIndex + '></div>';
            $(thisEle).after(element);
        }
        if (left === '0%') {
            left = '85%';
        }
        var style = document.querySelector('.gallery-area').style;
        style.setProperty('--left', left);
    },

    // 真正实现添加div
    doAppendDiv: function (cardsIndex, cardLen, size, element, thisEle) {
        if ((cardsIndex + 1) % size === 0 || cardsIndex + 1 === cardLen) {
            $(thisEle).after(element);
        } else {
            var addNumber = (size - (cardsIndex + 1) % size);
            var lastEle;
            if (cardsIndex + addNumber >= cardLen) {
                lastEle = $('#galleryCards .gallery-cards').eq(cardLen - 1);
                $(lastEle).after(element);
            } else {
                lastEle = $('#galleryCards .gallery-cards').eq(cardsIndex + addNumber);
                $(lastEle).after(element);
            }
        }

    },

    restoreGalleryCard: function (galleryArea) {
        if (typeof ($.fn.justifiedGallery) === 'function') {
            galleryArea.justifiedGallery('destroy');
        }

        if (cardViewer) {
            cardViewer.destroy();
        }
        cardViewer = null;
    }
}

$(function () {
    photo.showPhotos();
});

document.addEventListener('DOMContentLoaded', photo.loadGallery);