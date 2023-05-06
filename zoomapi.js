import {ZoomMtg} from '@zoomus/websdk'

ZoomMtg.setZoomJSLib('https://source.zoom.us/2.11.5/lib', '/av')

ZoomMtg.preLoadWasm();

ZoomMtg.prepareJssdk();

var API_KEY = 'EUtStlpVS8-ScMGR3xEfzQ';

var API_SECRET = 'HPk0Bv2Ma5tvmIvKnE7urERsbGg8NFtttf2Y';

let meetingSDKElement = document.getElementById('users_live')


export default {
    name: "ZoomFrame",
    data: function() {
      return {
        src: "",
        meetConfig: {},
        signature: {}
      };
    },
    props: {
      nickname: String,
      meetingId: String
    },
    created: function() {
      // Meeting config object
      this.meetConfig = {
        apiKey: API_KEY,
        apiSecret: API_SECRET,
        meetingNumber: 87329168359,
        userName: 'user',
        passWord: '',
        leaveUrl: "https://zoom.us",
        role: 1
      };

      // Generate Signature function
      this.signature = ZoomMtg.generateSignature({
        meetingNumber: this.meetConfig.meetingNumber,
        apiKey: this.meetConfig.apiKey,
        apiSecret: this.meetConfig.apiSecret,
        role: this.meetConfig.role,
        success: function(res) {
          // eslint-disable-next-line
          console.log("success signature: " + res.result);
        }
      });

      // join function
      ZoomMtg.init({
        leaveUrl: "http://www.zoom.us",
        isSupportAV: true,
        success: () => {
          ZoomMtg.join({
            meetingNumber: this.meetConfig.meetingNumber,
            userName: this.meetConfig.userName,
            signature: this.signature,
            apiKey: this.meetConfig.apiKey,
            userEmail: "email@gmail.com",
            passWord: this.meetConfig.passWord,
            success: function(res) {
              // eslint-disable-next-line
              console.log("join meeting success");
            },
            error: function(res) {
              // eslint-disable-next-line
              console.log(res);
            }
          });
        },
        error: function(res) {
          // eslint-disable-next-line
          console.log(res);
        }
      });
    },
    mounted: function() {}
  };
