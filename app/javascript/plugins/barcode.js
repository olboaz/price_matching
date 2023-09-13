import Quagga from '@ericblade/quagga2'; // ES6
//const Quagga = require('@ericblade/quagga2').default; // Common JS (important: default)


function detect_barcode(target){
  var last_result = [];

  if (Quagga.initialized == undefined) {

    Quagga.onDetected(function(result) {
      var last_code = result.codeResult.code;
      last_result.push(last_code);
      console.log(last_code)

      if (last_result.length == 1) {
        //const containerIndex = document.querySelector('.content-order');
        //var product_unit = Quagga.canvas.dom.overlay.parentNode.dataset.id
        //var product = window.location.href.substring(window.location.href.lastIndexOf('/') + 1);
        //console.log(product_unit)
        var code = last_code;
        last_result = [];
        Quagga.stop();
        // const closeButton = document.querySelector('.close-camera');
        // closeButton.click();

        // const chevrons = document.querySelectorAll(".chevron-barcode");
        // if (chevrons.length == 0 ) {
        var custId = 1
        var priceDate = "2023/01/01"


          $.ajax({
            type: "GET",
            url: `/get_barcode`,
            data: { ean: code, customerId: custId, date: priceDate },
            success: function(data){
                console.log(data)
               //containerIndex.innerHTML = data;
               //const event = new CustomEvent('turbolinks:load');
               //document.dispatchEvent(event);
            }
          });
        // } else {
        //   $.ajax({
        //     type: "POST",
        //     url: `/products/${product}/get_barcode`,
        //     data: { ean: code, product_unit_id: product_unit }

        //   });
        // }
      }
    });
  }
}

function init_quagga(target){
  Quagga.init({
    inputStream : {
      name : "Live",
      type : "LiveStream",
      target: target    // Or '#yourElement' (optional)
    },
    constraints: {
      width: 1280,
      height: 800,
      facingMode: "environment",
    },
    decoder : {
      readers : ['ean_reader'],
      debug: {
        drawBoundingBox: false,
        showFrequency: false,
        drawScanline: false,
        showPattern: false
      },
      multiple: false
    },
    locator: {
      "patchSize": "medium",
      "halfSample": true
    },
  }, function(err) {
      if (err) { console.log(err); return }
      Quagga.initialized = true;
      Quagga.start();
  });

  detect_barcode(target);
}

const barCodeScanner = () => {

  const barcodeButton = document.getElementById('barcode_button');
  
  barcodeButton.addEventListener("click", function onClick(e) {
    e.preventDefault();
    const target = document.querySelector('#barcode-scanner')
    init_quagga(target);
  });
   
}

export {barCodeScanner};
