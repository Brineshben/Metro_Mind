import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/Constants.dart';
import '../../utils/color_util.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();

  List<types.Message> _messages = [];
  final _user = types.User(id: '1');
  final _otherUser = types.User(id: '2');

  final String _apiUrl = "http://192.168.1.63:8001/accounts/psychiatrist-chat/";
  final String _token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQzNzQyNDkwLCJpYXQiOjE3NDM2NTYwOTAsImp0aSI6IjMyYWE1YjY0MTMwYzQ4YTE5MzFhZTk5YmIxM2QwZTIyIiwidXNlcl9pZCI6MX0.o9DIgQ71P8HAT8LsvLsIDvvjsdaa__jQ8x4V_VVUJPM";

  void _sendMessage(types.PartialText message) async {
    print("benchat${message.text}.");

    final msg = types.TextMessage(
      id: const Uuid().v4(),
      author: _user,
      text: message.text,
      createdAt: DateTime.now().millisecondsSinceEpoch,
    );

    setState(() {
      _messages.insert(0, msg);
    });

    final response = await http.post(
      Uri.parse(_apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_token',
      },
      body: jsonEncode({'message': message.text}),
    );

    if (response.statusCode == 200) {
      print("benchat");
      final responseData = jsonDecode(utf8.decode(response.bodyBytes)); // FIXED

      // final responseData = jsonDecode(response.body);
      print("benchat$responseData");
      final replyMsg = types.TextMessage(
        id: const Uuid().v4(),
        author: _otherUser,
        text: responseData['message'],
        createdAt: DateTime.now().millisecondsSinceEpoch,
      );

      setState(() {
        _messages.insert(0, replyMsg);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: systemUiOverlayStyleDark,
      child: Scaffold(

        body: Column(
          children: [
            Container(
                height: 130.h,
                decoration: BoxDecoration(
                  color: Colors.white, // Inside color as white
                 border: Border.all(
                   width: 0.2,
                   color: Colorutils.userdetailcolor
                 ),

                  gradient: LinearGradient(
                    colors: [Colors.blue.shade50, Colors.white],
                    // Adjust colors to match your design
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.3),
                      blurRadius: 0.1,
                      spreadRadius: 0.1,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 12.w),
                          // GestureDetector(
                          //   onTap: () {
                          //
                          //   },
                          //   child: Container(
                          //     height: 50.h,
                          //     width: 50.h,
                          //     padding: EdgeInsets.symmetric(horizontal: 9.h),
                          //     decoration: BoxDecoration(
                          //       color: Colors.white.withOpacity(0.1),
                          //       borderRadius: BorderRadius.circular(8.r),
                          //     ),
                          //     child: SvgPicture.asset(
                          //       "assets/images/menu_icon.svg",
                          //       fit: BoxFit.contain,
                          //     ),
                          //   ),
                          // ),

                          SizedBox(width: 12.w),

                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 30.r,
                            child: CircleAvatar(
                              radius: 25.r, // Ensure the radius is responsive
                              backgroundColor: Colors.white,
                              child: ClipOval(
                                child: Image.asset(
                                  "assets/images/utharam-logo.png",
                                  fit: BoxFit.cover,
                                  // Ensures the image is properly scaled and centered
                                  width: 54.r,
                                  // Double the inner radius to cover full area
                                  height: 54.r,
                                ),
                              ),
                            ),

                            // child: CircleAvatar(
                            //   radius: 25.r,
                            //   backgroundImage: CachedNetworkImageProvider(
                            //       "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxITEhUSEhMVFRUWGBUWFRUYFRUVFRYXFRUYFxUXFRcYHSggGBolHRUXITEhJSkrLi4uFx8zODMsNygtLisBCgoKDg0OGhAQGi0lICYrLS0tLS0tListLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLv/AABEIAOEA4QMBIgACEQEDEQH/xAAcAAABBQEBAQAAAAAAAAAAAAAAAgMEBQYHAQj/xABEEAABAgMEBwYCBwcEAQUAAAABAAIDBBEFEiExBiJBUWFxgRMykaGxwQdCI1JygtHh8BQzYpKisvFTc4PCsxUkNDVD/8QAGQEBAAMBAQAAAAAAAAAAAAAAAAECAwQF/8QAJBEBAQACAgMAAgIDAQAAAAAAAAECEQMxEiFBBCIyQhNRcWH/2gAMAwEAAhEDEQA/AO4oQhAIQhAIQhAIQhAIQqq057C63Hlt58PVRbohm29JoMuDW88jYwVodxccAudWv8WJm99DBhMb/GS93WhAHJWmkD2YiK4mnyMGNTsL8m8uC5Va8dt51GBuOVSSOfFY3PLbfHDHW24i6ezMzDq6jaGn0d5oJ441rTjTBQpa1Jgm8YkQDPVivafCqytiPLw5mQxdyIH6CubOinaa8M/8dKK1vok9ug2VpJHAAZF7SmbIgF7o7b4rTWPpVCim4/6N+VDg0ncCcjwPmuYtpS8BUcCLw4gjNKnIt5t5veAzyrwPsfxoqTksLhK7YhYb4f6WCMBLxTr0+jJzcBm0/wAQ9OS3K3l3GNmghCFKAhCEAhCEAhCEAhCEAhCEAhCEAhCEAhCEAhCRFiBoLjkBVBCtSduC6Mz5DiqGdiFooO+cz9UbeRp6r2LN1c5534c93QY8yFmrZtlsJrnE41pjjVxypv8A1zGVyaSC1Xshi86pcASBtrT+npQ8QuWTzXRHkNaMTk2tQOK10tZ0zOxMy2Ge8eB2Anbx8KLeWTojAgjBtTvOJKz76bepPbn2imjcUVLm0BB8+asJnRx0PFuO3d50XRDLBuQUKaaDgou1pYwsF7q0ODhgH5Y7GxG7a/W4bq0jzFWOJaKD5m5XSci3gaePPC9taVAOIFDgeHH36KgtQi7f6O5HBw6EE/dJWacp9QoswYURsWG66aghw+V4xa7rTEc13LRq2GzUuyMMCcHt+q9uDhy2jgQuANdeDobuVeObTy/W1ar4WaQmBMdhENGRaN5PGDD/ANTzbuW/Hlr0xzx9O0oQhbsAhCEAhCEAhCEAhCEAhCEAhCEAhCEAhCEAqq35i6ynUjfTIePorVZbSGZ1hzr4d3zVc7qLYzdZ+1p0Q20JoGgknaTt63jTwWVsmTM7NFz/AN3DN1o2V+Z3PZ0UfSa06u5a3Qd318lpvh/K0gg7Sube3Vjj4zbYSUs1jQGilFLBSYQFErtAFtGN9mIwqoUVqLQtaHDwJxPdaMXHkAq4zkZ+IY1g2XyS7qG4DxKzyrXHGoVsGuCy8dlQ9h21pzz9qfeWknQ494CtMwajwOIWftCGcaZilOY1h5gLGttemSeaY7sD6tPhT+VIm3XSIgNK502FPz7AIhpk7L+5vrTooZdeY5vh4Ye3gFpKysfQug1t/tcnDiE1eNSJ9pu3qKHqtAuHfBjSDspgy7zqxqAcIgrc8alvO6u4rqxu45cpqhCEKVQhCEAhCEAhCEAhCEAhCEAhCEAhCECIzqNJ3Alc90nmcXEnugfifY9Fvp46jug8SAuSaZTdGu4l39JIPsufny6jfgx3WBtSZLif4ojWfy4npWq6bY1o9nCa1sCMQAMbrQOes4HyXKHRQ2NLA5EveedQB6Fb5+k73EwoQbea28S4kADcAMXFZ6606PWrts5K1C/5Hs+0APQpyYjkg7OKxAn5wHGG4gk4ANBwNARjltrVbSRcTL1eKOpQ+KnV6qNzuM+ZiHDvObi45uJq9x3VVXMT8wRWHlhQ94UrdNMRgN/kreDYrXF2FaurSppy4hW7bJBbdxHAAUTGfdJzy+SsZZtpxnOLYrTUbRW6a5gV2hWM7BwvHCq0kKy2QxUDHec1S2waghZ5+mnH+zBW1DzpsxHTEeCqL+sDsdt3V/A08FcWyT4YFUkeHqYbMRy/VFOPSvJNV5KRjCjBwJbR2zMHMU47uS+ndHbSEzLQo2FXtF6mV4YPA4VBXy9GdeaHdDzFPYrs3wTtjtIMWXJxYQ9vEOwd0FGn7y6OOuTkjpiEIWzEIQhAIQhAIQhAIQhAIQhAIQhAIQhBHn/3buXuuH6bRMmg7BXm84+hXb7R/dP+y70XB9MYt6PdH1yP5Wj3K5ef+UdP4/1jbRNJiCNzQOrqu911KwLCF0PcKuIGwYblym2IgEyHbGvhk8hdr5VXe7GpcbyCreo2n9v+lQrNG0UHqpkNmq5o6Lybi0CZgTbWksxqMTxU+ldWxWMmDDcag0G4K4kbRDxgarOWnMzPbfQhnZ1F68DVwIybQi71qpcqHXcRQ1JwOVcgomVjTLCWbq6m3VCzFqDFXDZokUOfkVVWkxUz9rcf6sVaMGpcqOVex4IBqW1BG6lQfRaueg5rAaPRh+0xGnJxiDwfX0KnCblRzZasKZheb1HNv+Stf8I7U7GfY0mgiVhn71LteoCzlsS9yIMKXgCOeTgodnzBhR2uGBa5rgeRqtML9YZz4+tUJmTmBEhsiNye1rhycAR6p5dTkCEIQCEIQCEIQCEIQCEIQCEIQCEIQRbUdSDEP8J9F8/2469Hed3aHrfoPILv9rfuX/ZK+eZ8kve7fT3NPMLl5/5R1fj9VjrexeeNPcFdl+HdtiPKtJOuzUiDc5oz5EUPVcZtd1T+uatNA7d/ZJtpcaQotGRNwr3HnkT4Eq1x3imZatd3mXXnNHVEcwxi4ge6W0A8/VV0SxGPJfeeHHPWcRh/DWg6LKNcdfaTNWjDYK5+Q8SqeYtyK7VhQqnZUkdThWnGivBZbW5Ur9amPialKbIgZDmd/NS13hP/AFHsQRKfTFtSbwuginDE480mfNXeKVOOuuB3KJNRdUuWdqk7Zq25wMY924Gi5jo7F+nY45knzzWw0mj3mRDsAdTwWMsRn08Ln6hb8U/Wsee/tG00lh3oQd9V9OjsR5lZyKMWnf8Ar2K1U/rMiM4NPXBvsswWVA6+TvzKz4r3FuSdPpvQeKXSEuT/AKYHQEgeQCvFU6JyhhScvDdm2G2vMip9VbLtcVCEIRAQhCAQhCAQhCAQhCAQhCAQhCCLarCYMUDO4+nO6aL5/nYdD1HsDVfRJC4ppDZVx0WG6oLH0GGbSatNeIOH5Ln551XRwZdxyW0G67gdhNOSgvGAV3acsbxDs9jvYqbojYfaTDL9C1hDs8Djt5VCtgZOn6Bz7/2aDBmT9Lc1a5uYO6CdrgKV/wArVw8DRU1t2MD2UVtAYLgcN1KOpTgSUsz5Y5rXfMNU7yM289vLkp5OHU850jDllvjV9dCjTbgBXYoxtRtPY4eqrpu0b2H5rG1vIjWpHqVT2nPahA3KfFhlyqrRgYFZ6astbouwDXqq2z7Pb2rHmraC9wyJ8PwV7pFLl0C6BUmlB1Tn7KexhktxDQ00+Y7h/CD6c1thZ4X/AGwzm84i9rURDyHhUnzqrv4a6Hvm47Yz20l4TquJGERwNRDbvxAvHdzVdZVkvjRYUtD7z3EVOQFKudxAAr93iF9A2NZkOWgQ4EIUZDaGjedpceJNSeJThw+q8+fxNQhC6XKEIQgEIQgEIQgEIQgEIQgEIQgEIQgFSaRaOsmRUOuRAC29S8HDHVe3C8BWoxwV2So75toBOdM01s3p8/aV6PxZV7mx2spm14JDXDeKhVtkWXFiva2AKDAl2NBtz9uK3Ons4J6ck5LMPitiRNtIbXUucjdcT9kLpUGQht7rWjkAFF4PHS/+bamsaynNlxDeS401nHMnaeCrY1m9rDfCOD2OqDtBGTh5HqtqGKlnofZzDHfLErDd9rNv64Lo4/e8XPyb9ZMbKzVS6HEwiNwPHcRwKduCuxPabWfcLY7MxnxG0e/iq2WnCWgrzuXj8MtPR4uTzx2tYw1diz020k04q7EzVuaroEK9ErsVI02zGlcVzGm7sGK0ug1nNmpKHEcfrtPNr3N28lntI4d/tQNxA8FsfhBAIs4E/NEikcg676tK6/x8Z/px/k5V7ZlmthuLgPpK0vbRQ4U3b1t5DSBl0CNUOyvUqDxwyKoo8GkR3HH9eC8EIHA5FWuPjdRSXym62sCbhv7j2nkcfBPLBw4N3A9DvVlLzUVvdeeRxHmp0jbVIVLBtd47zQeWCnS9osfhiDx/FNCYhCFAEIQgEIQgEIQgELy8kPiUQKe8DNRIs+NgTMy4kpgMUyItKiTBdtUaZiapAT91RZ4UadxB9FZVzzQxnb2tEj01WG63hdhFop1qeq620LlfwdxfFrnUH+ldUqBmQOeC15/56Rx9FUUK1JPtYZbkRrNO5wxafFTBFbvC9GKylsu1rNzTJ6Q2hBEu0zGqXPEMilaO+a9uZQ1J3Eb1kpiznQHFvynun2P6xXQNJLBZMwy0gXth6ZFYbRx7ix8pGxdBJAqcbgqCOTTQj7XBa8nFjy8e53FeLly4stXpEa45Kys5gGahz8qYZ54tO8KTZb3PoBicaeG1eb42XVelbLjuX0poci6I9waCSXmgGJ3KfPWhGk5VsvAcGObWpAa434kQuIxBGF6iuGxYcvDMOFrxXA9pEGQ3hp/W9ZqPWLGgwt72k8ga+xXqfj8PhPLJ5vPzed8Z01lkxosSE2JFILqAE0ArzAwVlDhpqXlrjC3+Ko5U/NPPlXOGDnDChANDzBzWfNZc9w4tzH28no0KGysaIyGNjnua0V2UqU7KUIqMQuc6X6JOiAuFYj2a7LxJc76zKnePOi0Pw3tkRpcw3Gr4VBXa+G4Vhv8ADA8WlJj+u02+9NfCC8jQwnIAwSZx2ACqHZCfc00cat8S38leArNMGSnWZOUeYLsjUsPDa31oqWLRboQhQkIQhALwr1eFAkpqInSmnoIrwhrEo5pYCtFTL2KO5gcHMO3D8wpzmrm3xJt2KHsk5ckRInec0kOAcaBoIyrQkndRXwxuV0rbpWfD/wChnpmXJoRXI07jyDlwcF1NkBta0xXJ5H4bRg0PhTHZxm44AtFTuc01HPyVlJ6RWlJOEOch9o2tA40bX7EUapPB4BO9b54+d3jVJfHt1BoToCiWbMdpDZEuuaHtDg1wuuAO8bCpYXLW0FFgtL7KdAjidhDAkCINgOVTwcMD+a3yampdsRjmPFWuBBG8FX48/C7Vyx8oyMSVZGghu8Xm7wTiKHyVPLS5hBzPmJ1vs/KBzz8NyvGwDAe2GcQMGne3Z1S7UlQ8doO83PiPxXR4Y+UyYf5MpjcFfLQBlvUey7H/APeB1MG3j4toPVTGGl08aeIP4K6skVLnUyAHjj7K2d1Krh7pcaGE5LMwXkVSYTMAuJ1mJuzw8VGDth/Fcknb1m2neIuw31Lvq9nFP0lPsxCH8nldhm5kQ2Fx6DeVzDTqUMeXfHNSYJBHFpwjf0nyWvFfer0pnPW3Rpc6oPBIiNxqVmtAbYMaSDXGsSD9E87SG9x3VtCtPCbhUquU1dJnRLWJiffR7SM2k05ihUqIcKqExt+ITsBPqqpjVQn3gHDaAfFKVdYcxeY4bWPc3pW8PI06KxVFghCEAvCvUkoElNvThTb0DBS2FIKUFZU4QuVdj2tuPJ+QPI+5SF+K6qCuVzBMG2Cf9XtoY4ExO1/tc3xW/D1l/wAUz+N32rnGkMDDC+dvADaE3MS0WI0tf2cVpwcxzaV3jd4qfIw6AKRFh0N4dVlKtpUM0ghwnsgxwYQdqsee5eaO48/KSBUHI0ORwN+FndLrLExLPaAL9KsJyD2m9DJOwXgK8CVS/DaNMMbGl4oeBCiEMa8OFGOAIDK/LnSmG5X8JcfKI8tXVb1C8aUpZLq+15HtWYd4YtPHd1VJKRScDhmCDicM67sjtWrWct+WuO7VtQDQOoAcdhrSvD/JW3Fn/Vjy4f2VrmAFzfqubTk7L1V7ZMG7Cx+Yk9Mh6LORIuu5wx1WuptN0nzwWvDKNDdwAWnNdYyKcU97Q3jFTAQBU4CmajFusmbQjV1Blt48FzOhV2nHdFdhlk0fraU5MyDRC7MioIIdxrmpklLAa52Zc1Ejxy52GSmk9ucaLRjJTrpd3diDsvvMq6A7qyrOJauoybq5rnXxBs55IjwxQtutvfxh16C7o/V/5CtjoxabY8CHGb87QSNzsnN6EEdFpn7kyUnr0uJ91G9R6puRZRpO9eWk7Bo3lPQcqZNGZWa3w1o7HpMRYf1mh3Vp/B3ktKsPZ8ekw2JsdEu9HVb7rcLNoEIQiAklKSSgSU29LKbegZKWkFLCsqTWnJUNvaMQ4sZkyXPBY+G8BtALzaNJJpWhAaCMO7xV+4b8koMBYWnKhHRXxyuPuGt9mJVtMFKiNqMFHl64VzpjzGB81JaVWiKR/hRmYPrwHgKt9gp8aHtChRhrA8/b8CpiNJrTVOgqPCKeaVVMLTUzBDmlpyKWvaolioEuWzjYbufMNJNVqnlNzco0uEWms0FoPBxBPoE3FmLowxJyHvyWmefnpTHDx2RNxKGgz9KpuFBqvYMA5nPapzGUCqmmJlmrdChuaGjAKTMuNaBJhS+0qEqXSCT7SViQ8i5hFdoNMCOINCsV8NrVuujQHYf/ALMG4l1yM0cGxAf5l0K1TqHkuVWswSlow3jBjwxx+zFAhROgeyG77y0wu5cVbPcrp0xHvOhgZkHopk0w3LowG1Z+yIpe69kD4057FfxrrWE8FT4t9U84KEBvy63XYt1LxQ9rXjJwDhyIqsM1pIc45lafRaNelmb21aehw8iFnV1shCEQCklelJKBJTb04U29AynGpsp1qsq8cvILsaJTkw/Ag8RX3UxFOtFHEdR1z88fvJ1qaiH5t2fI5+x+6nQiz0hQJluI+03wxHup6hz4oK/Z/uCRBYFME4CvSKhIyQPByCmgUqqgKcFWRYF15O/y4BWQckPg3hTwPFEmoYXrikMwNDmEtylBlzcapLnpbimnBEK+02YOPBc0+JUIObBdxdCJ3CI3D+trF1Ce7tDtqFjtLZBsSB3QbrmuNcRux5YHopxuspVrNzQ0Mn+1gw4hzLdbg4YO8wVopuJeo0dVSSLWh9IcMMa8CK0NADAIgDiBTDBxcOivYUs5rtcUKX2a0IrLsM8lL0KjYRIfEOHXA+gUS036t0bV7owbscD6wcPK9/1VMkzpsUIQoHhSSlFIKDwptyWUh6INJ1ibCcarIeOCZj5HkfRPxFFnHgMc47Gk+SmIp+UJdDaXDEtaSOJGISoR2bR6bD+toKotG9K5WYpChxKRRUGE4Fr6sGtQHA5bCr2KNo/yP1+sSps1dJnRxRbTGqOJA8wfZSWu2hQpiJfihoxDBedwccGjwJPRQlJYcAglMxYwaMT+fJcxndI7UiT3ZwWlohxGtLWtrCLDSt9zhWtK44cBvtjjtDqRC9KRCdUYpxVAMEsJDQnAoSiT2DmnfUeH+V6vbQGDeDh5gptrlKKQU1EKVFiYqPEeiDE27VWS0lhxYhgy8Kl6M8jGt0NY285z6YloArQZmgwrUamYOqVmbfnjAiysZovOY+JqYC+xzKRGgnAGlCCcKtANAah9X+EwWxJR47WJ2sNmD6taxzGXi5zoZbTAVLrrq1FaGtFv55zYsFzm95lSN9QK05Eeq5xbdpice9sKE9hi6j3vhmEGMoRUucBfIaTQNvYndUrU3xDhupm8UHUU8AApqIZiUcalNMj3IsNwya5pPKut5VSwUzNMVatHQkLN/wDqg+t5heKg0hSChClBJSHIQpQbCcahClD16odLf/hTH+25eoV8O4OR/D//AOwZ/wAv9pXeIfd6IQrcvaJ0Qz5uZ9AoFjd2L/uO9GoQs1zMX9/0C9g993M+yEKYrVlDSyhCghTUoIQoSj2h3OrfVQyhCkMvTDkIRBmPkeSxumvflP8Acif+IoQk7Whux82rSRMxyXqEK9hr2a+XqhCiiEhCFms//9k="),
                            //   backgroundColor: Colors.white,
                            //   onBackgroundImageError: (exception, stackTrace) {
                            //     // Handle error (optional)
                            //   },
                            // ),
                          ),
                          SizedBox(width: 4.w),

                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'MetroMind Bot',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.h,
                                    color: Colors.black.withOpacity(0.9),
                                  ),
                                ),
                                Text(
                                  'online',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.h,
                                    color:Colorutils.userdetailcolor,
                                  ),
                                ),

                                // TextScroll(
                                //   'This is the sample text for Flutter TextScroll widget. ',
                                //   mode: TextScrollMode.bouncing,
                                //   velocity: Velocity(pixelsPerSecond: Offset(150, 0)),
                                //   delayBefore: Duration(milliseconds: 500),
                                //   numberOfReps: 5,
                                //   pauseBetween: Duration(milliseconds: 50),
                                //   style: TextStyle(color: Colors.green),
                                //   textAlign: TextAlign.right,
                                //   selectable: true,
                                // )
                                // SingleChildScrollView(
                                //   scrollDirection: Axis.horizontal,
                                //   child: Row(
                                //     children: [
                                //       Text(
                                //         controller.userData.value.name ?? "--",
                                //         style: TeacherAppFonts.interW600_18sp_textWhite,
                                //       ),
                                //     ],
                                //   ),
                                // ),
                              ],
                            ),
                          ),

                          SizedBox(width: 12.w),
                          IconButton(
                            icon:
                                Icon(Icons.call, color: Colorutils.userdetailcolor, size: 28),
                            onPressed: () {
                              print("");
                            },
                          ),

                          // CircleAvatar(
                          //   radius: 26.r,
                          //   child: CircleAvatar(
                          //     radius: 25.r,
                          //     child: ClipRRect(
                          //       borderRadius: BorderRadius.circular(100).r,
                          //       child: CachedNetworkImage(
                          //         imageUrl:
                          //         "https://media.istockphoto.com/id/1029035836/photo/ai-robot-thinking.jpg?s=612x612&w=0&k=20&c=Lf-nilserdw8BVnHPKtkkSbw7Pcp5p7KI_V9CAlzqQI=",
                          //         fit: BoxFit.fill,
                          //         placeholder: (context, url) =>
                          //             Image.asset("assets/profileOne.svg", fit: BoxFit.cover),
                          //         errorWidget: (context, url, error) =>
                          //             Image.asset("assets/profileOne.svg", fit: BoxFit.cover),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          SizedBox(width: 12.w),
                        ],
                      ),

                      // Padding(
                      //   padding: const EdgeInsets.only(left: 20, right: 20,top: 12,bottom: 10),
                      //   child: Container(
                      //     height: 50.h,
                      //     decoration: const BoxDecoration(
                      //         border: Border(),
                      //         borderRadius: BorderRadius.all(Radius.circular(30))),
                      //     width: double.infinity,
                      //     child: TextFormField(
                      //       autofocus: true,
                      //       // controller: textcontroller,
                      //       onChanged: (value) async {
                      //
                      //       },
                      //       validator: (val) =>
                      //       val!.isEmpty ? 'Enter the Topic' : null,
                      //       cursorColor: Colors.grey,
                      //       keyboardType: TextInputType.text,
                      //       decoration: InputDecoration(
                      //           hintStyle: const TextStyle(color: Colors.grey),
                      //           hintText: "Search Patients",
                      //           prefixIcon: Padding(
                      //             padding: const EdgeInsets.all(8.0),
                      //             child: SizedBox(
                      //                 height: 25,
                      //                 width: 25,
                      //                 child: SvgPicture.asset(
                      //                     "assets/images/MagnifyingGlass.svg")),
                      //           ),
                      //           contentPadding: const EdgeInsets.symmetric(
                      //               vertical: 10.0, horizontal: 25.0),
                      //           border: const OutlineInputBorder(
                      //             borderRadius: BorderRadius.all(
                      //               Radius.circular(2.0),
                      //             ),
                      //           ),
                      //           enabledBorder: OutlineInputBorder(
                      //             borderSide:
                      //             BorderSide(color: Colors.grey.withOpacity(0.2)),
                      //             borderRadius: const BorderRadius.all(Radius.circular(30)),
                      //           ),
                      //           focusedBorder: const OutlineInputBorder(
                      //             borderSide: BorderSide(
                      //                 color: Color.fromRGBO(230, 236, 254, 8),
                      //                 width: 1.0),
                      //             borderRadius: BorderRadius.all(Radius.circular(30)),
                      //           ),
                      //           fillColor: Colors.green[50],
                      //           filled: true),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                )),
            Expanded(
              child: Chat(
                showUserAvatars: true,
                // Show user avatars
                showUserNames: true,
                // Show usernames
                inputOptions: InputOptions(
                  sendButtonVisibilityMode:
                      SendButtonVisibilityMode.always, // Fix applied
                ),
                messages: _messages,
                onSendPressed: (_) {},
                user: _user,
                theme: const DefaultChatTheme(
                  primaryColor: Colorutils.userdetailcolor,
                  sentMessageBodyTextStyle: TextStyle(color: Colors.white),
                  receivedMessageBodyTextStyle: TextStyle(color: Colors.black),
                ),
                customBottomWidget: _buildCustomInputField(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomInputField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            // IconButton(
            //   icon: const Icon(Icons.emoji_emotions_outlined, color: Colors.white54),
            //   onPressed: () {},
            // ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: TextField(
                controller: _messageController,
                decoration: const InputDecoration(
                  hintText: "Message",
                  hintStyle: TextStyle(color: Colors.white54),
                  border: InputBorder.none,
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
            /* IconButton(
              icon: const Icon(Icons.attach_file, color: Colors.white54),
              onPressed: () {},
            ),*/
            // IconButton(
            //   icon: const Icon(Icons.currency_rupee, color: Colors.white54),
            //   onPressed: () {},
            // ),
            // IconButton(
            //   icon: const Icon(Icons.camera_alt_outlined, color: Colors.white54),
            //   onPressed: () {},
            // ),
            Container(
              decoration: const BoxDecoration(
                color: Colorutils.userdetailcolor,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.send_sharp, color: Colors.white),
                onPressed: () {
                  if (_messageController.text.trim().isNotEmpty) {
                    _sendMessage(
                        types.PartialText(text: _messageController.text));
                    _messageController.clear();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
