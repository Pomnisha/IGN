ymaps.ready(function () { 
var myMap = new ymaps.Map("YMapsID", {
        // Центр карты
        center: [55.76, 37.64],
        // Коэффициент масштабирования
        zoom: 10,
        // Тип карты
        type: "yandex#satellite"
    }
);

var myPlacemark = new ymaps.Placemark(
        // Координаты метки
        [55.8, 37.6], {
            /* Свойства метки:
               - контент значка метки */
            iconContent: "Москва",
            // - контент балуна метки
            balloonContent: "Столица России"
        }, {
            /* Опции метки:
               - флаг перетаскивания метки */
            draggable: true,
            /* - показывать значок метки 
               при открытии балуна */
            hideIconOnBallon: false
        }
    );

myMap.events.add("click",
    function(e) {
        myMap.balloon.open(
            // Позиция балуна
            e.get("coordPosition"), {
                // Свойства балуна:
                // контент балуна
                contentBody: "Значение: " +
                e.get("coordPosition")
            }   
        )
    }
);    
    
    
// Добавление стандартного набора кнопок
myMap.controls.add("mapTools")
    // Добавление кнопки изменения масштаба 
    .add("zoomControl")
    // Добавление списка типов карты
    .add("typeSelector");    
// Добавление метки на карту
myMap.geoObjects.add(myPlacemark);


});

