/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./liveStreaming.js":
/*!**************************!*\
  !*** ./liveStreaming.js ***!
  \**************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var agora_rtc_sdk_ng__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! agora-rtc-sdk-ng */ \"./node_modules/agora-rtc-sdk-ng/AgoraRTC_N-production.js\");\n/* harmony import */ var agora_rtc_sdk_ng__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(agora_rtc_sdk_ng__WEBPACK_IMPORTED_MODULE_0__);\n\n\nlet rtc = {\n    // For the local audio and video tracks.\n    localAudioTrack: null,\n    localVideoTrack: null,\n    client: null,\n};\n\nlet options = {\n    // Pass your app ID here.\n    appId: \"4495024a2d414911932996a968fc8559\",\n    // Set the channel name.\n    channel: \"fc8559IABbwUWGis6q8BrcLHw\",\n    // Use a temp token\n    token: \"0064495024a2d414911932996a968fc8559IADsx3vC3n4Kp32MJGcFquMUJF2SHyL1RR9oW47gcxq8cnXvVzsAAAAAEAA0Cwr7OffYYgEAAQA499hi\",\n    // Uid\n    uid: 6010203,\n};\n\nasync function startBasicLiveStreaming() {\n    // rtc.client = AgoraRTC.createClient({mode: \"live\",codec: \"vp8\"});\n\n    window.onload = function () {\n\n        async function userPublished(){\n            rtc.client.on(\"user-published\", async (user, mediaType) => {\n                // Subscribe to a remote user.\n                await rtc.client.subscribe(user, mediaType);\n\n                // Get `RemoteVideoTrack` in the `user` object.\n                const remoteVideoTrack = user.videoTrack;\n                // Dynamically create a container in the form of a DIV element for playing the remote video track.\n                const remotePlayerContainer = document.createElement(\"div\");\n                remotePlayerContainer.id = user.uid.toString();\n                remotePlayerContainer.style.width = \"240px\";\n                remotePlayerContainer.style.height = \"240px\";\n                remotePlayerContainer.classList.add('m-2');\n                remotePlayerContainer.style.transform = \"rotateY(180deg)\";\n                document.getElementById(\"users_live\").append(remotePlayerContainer);\n\n                // Pass the DIV container and the SDK dynamically creates a player in the container for playing the remote video track.\n                remoteVideoTrack.play(remotePlayerContainer);\n\n                user.audioTrack.play();\n            });\n        }\n\n        async function userUnpublished(){\n            rtc.client.on(\"user-unpublished\", user => {\n                // Get the dynamically created DIV container.\n                const remotePlayerContainer = document.getElementById(user.uid);\n                // Destroy the container.\n                remotePlayerContainer.remove();\n            });\n        }\n\n        // récupérer les infos des remote users et afficher ...\n        //APPELER CETTE FONCTION CHAQUE 5 SEC POUR VOIR SI CELA VA RESOUDRE LE PROBLEME\n        async function publishRemoteUsers(rtc){\n            for (const tmp_user of rtc.client.remoteUsers) {\n                 if(tmp_user.hasVideo){\n                     await rtc.client.subscribe(tmp_user, \"video\");\n                     // Dynamically create a container in the form of a DIV element for playing the remote video track.\n                     const remotePlayerContainerTemp = document.createElement(\"div\");\n                     // Specify the ID of the DIV container. You can use the `uid` of the remote user.\n                     remotePlayerContainerTemp.id = tmp_user.uid.toString();\n                     remotePlayerContainerTemp.style.width = \"240px\";\n                     remotePlayerContainerTemp.style.height = \"240px\";\n                     remotePlayerContainerTemp.classList.add('m-2');\n                     remotePlayerContainerTemp.style.transform = \"rotateY(180deg)\";\n                     document.getElementById(\"users_live\").append(remotePlayerContainerTemp);\n\n                     tmp_user.videoTrack.play(remotePlayerContainerTemp);\n                 }\n\n                 if(tmp_user.hasAudio){\n                     await rtc.client.subscribe(tmp_user, \"audio\");\n                     tmp_user.audioTrack.play();\n                 }\n            }\n        }\n\n        document.getElementById(\"join\").onclick = async function () {\n            const uid = $(this).data('uid'),\n                data_type = $(this).data('type');\n\n            await registerUserToLive();\n\n            if(!localStorage.getItem(\"is_registered\")){\n                return ;\n            }\n\n            if (data_type == \"host\") {\n                await joinLive(\"host\", uid);\n            } else {\n                await joinLive(\"audience\", uid);\n            }\n\n            $(\"#join\").addClass('d-none');\n            $(\"#leave\").removeClass('d-none');\n\n        };\n\n        async function joinLive(role, uid){\n            rtc.client = agora_rtc_sdk_ng__WEBPACK_IMPORTED_MODULE_0___default().createClient({mode: \"rtc\",codec: \"vp8\"});\n\n            // register user in db and join live on Agora\n\n            await rtc.client.join(options.appId, options.channel, options.token, uid);\n\n            // Enable dual-stream mode.\n            rtc.client.enableDualStream();\n\n            // first show the others\n            await publishRemoteUsers(rtc);\n\n            // Create an audio track from the audio sampled by a microphone.\n            rtc.localAudioTrack = await agora_rtc_sdk_ng__WEBPACK_IMPORTED_MODULE_0___default().createMicrophoneAudioTrack();\n            // Create a video track from the video captured by a camera.\n            rtc.localVideoTrack = await agora_rtc_sdk_ng__WEBPACK_IMPORTED_MODULE_0___default().createCameraVideoTrack();\n\n            // screen-sharing ...\n            // rtc.screenTrack = await AgoraRTC.createScreenVideoTrack();\n\n            // Publish the local audio and video tracks to the channel.\n            await rtc.client.publish([rtc.localAudioTrack, rtc.localVideoTrack]);\n\n            // Dynamically create a container in the form of a DIV element for playing the remote video track.\n            const localPlayerContainer = document.createElement(\"div\");\n\n            // Specify the ID of the DIV container. You can use the `uid` of the remote user.\n            localPlayerContainer.id = options.uid;\n            localPlayerContainer.style.width = \"240px\";\n            localPlayerContainer.style.height = \"240px\";\n            localPlayerContainer.classList.add('m-2');\n            document.getElementById(\"users_live\").append(localPlayerContainer);\n\n            rtc.localVideoTrack.play(localPlayerContainer);\n\n            await userPublished();\n\n            await userUnpublished();\n        }\n\n        document.getElementById(\"leave\").onclick = async function () {\n            rtc.client = agora_rtc_sdk_ng__WEBPACK_IMPORTED_MODULE_0___default().createClient({mode: \"rtc\",codec: \"vp8\"});\n\n            // Close all the local tracks.\n            rtc.localAudioTrack.close();\n            rtc.localVideoTrack.close();\n            // Traverse all remote users.\n            rtc.client.remoteUsers.forEach(user => {\n                // Destroy the dynamically created DIV containers.\n                const playerContainer = document.getElementById(user.uid);\n                playerContainer && playerContainer.remove();\n            });\n\n            // Leave the channel.\n            await rtc.client.leave();\n\n            disconectUserFromLive();\n            // savoir que c'est l'admin et supprimé le live\n\n            window.location = $('#prev').html();\n        };\n\n        async function registerUserToLive(){\n            let current_url = window.location.href;\n\n            current_url = current_url.split(\"/\");\n\n            let live_id = current_url.at('-1');\n\n            $.ajax({\n                url: \"/beta-test/\"+live_id,\n                success: function (response) {\n                    localStorage.clear();\n\n                    if (response.status != 200) {\n                        // throw new Error(\"User already registered\");\n                        localStorage.setItem('is_registered', true)\n                    }else{\n                        localStorage.setItem('is_registered', false)\n                    }\n\n                    new Promise(r => setTimeout(r, 2000));\n                }\n            });\n        }\n\n        async function disconectUserFromLive(){\n            let current_url = window.location.href;\n            current_url = current_url.split(\"/\");\n\n            let live_id = current_url.at('-1');\n\n            $.ajax({\n                url: \"/beta-test-disconnect/\"+live_id,\n                success: async function(result){\n                }\n            });\n        }\n\n        // async function yourFunction(){\n        //     setTimeout(yourFunction, 2000);\n        //     console.log('hey')\n        //     await publishRemoteUsers(rtc);\n        // }\n        //\n        // yourFunction();\n    };\n}\n\nstartBasicLiveStreaming();\n\n\n//# sourceURL=webpack:///./liveStreaming.js?");

/***/ }),

/***/ "./node_modules/agora-rtc-sdk-ng/AgoraRTC_N-production.js":
/*!****************************************************************!*\
  !*** ./node_modules/agora-rtc-sdk-ng/AgoraRTC_N-production.js ***!
  \****************************************************************/
/***/ (function(module, __unused_webpack_exports, __webpack_require__) {


/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	/* webpack/runtime/compat get default export */
/******/ 	(() => {
/******/ 		// getDefaultExport function for compatibility with non-harmony modules
/******/ 		__webpack_require__.n = (module) => {
/******/ 			var getter = module && module.__esModule ?
/******/ 				() => (module['default']) :
/******/ 				() => (module);
/******/ 			__webpack_require__.d(getter, { a: getter });
/******/ 			return getter;
/******/ 		};
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/define property getters */
/******/ 	(() => {
/******/ 		// define getter functions for harmony exports
/******/ 		__webpack_require__.d = (exports, definition) => {
/******/ 			for(var key in definition) {
/******/ 				if(__webpack_require__.o(definition, key) && !__webpack_require__.o(exports, key)) {
/******/ 					Object.defineProperty(exports, key, { enumerable: true, get: definition[key] });
/******/ 				}
/******/ 			}
/******/ 		};
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/global */
/******/ 	(() => {
/******/ 		__webpack_require__.g = (function() {
/******/ 			if (typeof globalThis === 'object') return globalThis;
/******/ 			try {
/******/ 				return this || new Function('return this')();
/******/ 			} catch (e) {
/******/ 				if (typeof window === 'object') return window;
/******/ 			}
/******/ 		})();
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/hasOwnProperty shorthand */
/******/ 	(() => {
/******/ 		__webpack_require__.o = (obj, prop) => (Object.prototype.hasOwnProperty.call(obj, prop))
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/make namespace object */
/******/ 	(() => {
/******/ 		// define __esModule on exports
/******/ 		__webpack_require__.r = (exports) => {
/******/ 			if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 				Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 			}
/******/ 			Object.defineProperty(exports, '__esModule', { value: true });
/******/ 		};
/******/ 	})();
/******/ 	
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval devtool is used.
/******/ 	var __webpack_exports__ = __webpack_require__("./liveStreaming.js");
/******/ 	
/******/ })()
;