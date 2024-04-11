'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"32x32_bountyfever.png": "a7d5e16254dac1f7edc689ee2dde4426",
"assets/AssetManifest.bin": "fad02bba6cce4da4de94e1f0f2778af6",
"assets/AssetManifest.bin.json": "07d1841bed23d0e2df3c762612de83bd",
"assets/AssetManifest.json": "4bb4afbee5a9c78dc01284da48d933c3",
"assets/assets/audios/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/fonts/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/fonts/GrenzeGotisch-VariableFont_wght.ttf": "2e826f4ec6f3cff4886bb55ec1a6f76a",
"assets/assets/fonts/Honk-Regular-VariableFont_MORF,SHLN.ttf": "c675433ac017fa2313e792101f293234",
"assets/assets/fonts/Roboto-Bold.ttf": "b8e42971dec8d49207a8c8e2b919a6ac",
"assets/assets/fonts/SansitaSwashed-VariableFont_wght.ttf": "dae660fb0b8e35eaa8ee974aa1329ade",
"assets/assets/images/app-download-android.700c0ca3.svg": "3b34c5d41396a5890c36fb506c9509c2",
"assets/assets/images/app_launcher_icon.png": "fb3cefea74ef03337e1ae39898a3f8af",
"assets/assets/images/Default_add_an_F_into_the_picture_0_4855a683-1aa8-4263-97de-4830b4e0c690_0.png": "fb3cefea74ef03337e1ae39898a3f8af",
"assets/assets/images/facebook.png": "fd605db9264943dbc5049751b13e48fb",
"assets/assets/images/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/images/free-number-counter-vector-illustration-removebg-preview.png": "b2a74e6dbff50a3d564caa0bef363baa",
"assets/assets/images/gift-box.png": "0313d6711dd4d2fcd1881aeb41e7f5db",
"assets/assets/images/instagram.png": "b674ecb079415b63ecacaab2cb4cfade",
"assets/assets/images/live.gif": "e984fab08e70820ca3df33506ded314a",
"assets/assets/images/Person_Icon_generated-removebg-preview.png": "7d15ed0fac27f388931d9a827f3ad7f8",
"assets/assets/images/social_images_2.png": "db829546d5b3b06b15fb67f2112eb020",
"assets/assets/images/splash_preview.png": "cfbee27f08bca37c4b28ea413c2045b4",
"assets/assets/images/survey.png": "72ef427b6f5e77b6f82b1fafa29d6e34",
"assets/assets/images/ticket.png": "8c7bf10f6793f4bd8b515c4064bafa75",
"assets/assets/images/tiktok.png": "2b4dca08a5e33443bb7e6803811236ab",
"assets/assets/images/twitter_(2).png": "647ac23944cfcffdc18f407ec6fb3e45",
"assets/assets/images/vecteezy_brand-new-rubber-stamp-red-brand-new-rubber-grunge-stamp_20312794-removebg-preview.png": "41735b6039209e9055a4c07b4cb65193",
"assets/assets/images/vecteezy_golden-confetti-isolated-festive-background_14846833-removebg-preview.png": "f17062c29d6c974c4e9cbe7571a9393f",
"assets/assets/images/vecteezy_open-and-closed-box-carton-shipping-p985-removebg-preview_(1).png": "86e756392df8306de767b1e6ffd2962b",
"assets/assets/images/video.png": "2fdb3c7309d2b611bde4bcb1e3b0174a",
"assets/assets/images/web_light_rd_ctn@1x.png": "e38f156f3a596b4f75f4c136a4728c6c",
"assets/assets/images/web_light_rd_SU@1x.png": "4b1c3a46c52ca4dd47957ba7f9dc3c00",
"assets/assets/images/youtube.png": "462cc5400d6790884e2e1dc20196970b",
"assets/assets/lottie_animations/Aniki_Hamster.json": "eeb1970bde6af9f6e4765efe66747148",
"assets/assets/lottie_animations/Animation_-_winner.json": "fb1f1c8ab467cd6af325e70f8d8a6ef3",
"assets/assets/lottie_animations/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/pdfs/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/rive_animations/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/videos/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/FontManifest.json": "11f1d3a5c1f479f3009c2b6f49db79d5",
"assets/fonts/MaterialIcons-Regular.otf": "69862d6af598a3972b345223645792b9",
"assets/NOTICES": "7c506301feccbf9e83189a8b606d6d45",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "f25e8e701660fb45e2a81ff3f43c6d5c",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "a5d7457fda15b7622c14f432ba63039a",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "3f9d3a81e3d8fc32f86d5265922fc415",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"canvaskit/canvaskit.js.symbols": "38cba9233b92472a36ff011dc21c2c9f",
"canvaskit/canvaskit.wasm": "3d2a2d663e8c5111ac61a46367f751ac",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/chromium/canvaskit.js.symbols": "4525682ef039faeb11f24f37436dca06",
"canvaskit/chromium/canvaskit.wasm": "f5934e694f12929ed56a671617acd254",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/skwasm.js.symbols": "741d50ffba71f89345996b0aa8426af8",
"canvaskit/skwasm.wasm": "e42815763c5d05bba43f9d0337fa7d84",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "2704101cb06ce66e2000356a312be25c",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"icons/app_launcher_icon.png": "fb3cefea74ef03337e1ae39898a3f8af",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "adfb641f2b4b858dd6b15e99748ef1d9",
"/": "adfb641f2b4b858dd6b15e99748ef1d9",
"main.dart.js": "71c264e5a07f48f59163be24fb1523ef",
"social_images_2.png": "db829546d5b3b06b15fb67f2112eb020",
"version.json": "7d6fc2bc0a99eb5d2ae4fc47abb08b45"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
