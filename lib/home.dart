import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:screenshot/screenshot.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScreenshotController _screenshotController = ScreenshotController();
  var _value = '-1';

  saveToGallery(){

    _screenshotController.capture().then((Uint8List? image){
      saveScreenshot(image!);
    });

    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Saved to gallery'))
    );

  }

  saveScreenshot(Uint8List bytes) async {
    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '_')
        .replaceAll(':', '_')
    ;
    final name = "Screenshot_$time";
    await ImageGallerySaver.saveImage(bytes, name: name);
  }

  // @override
  // void initState(){
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  //
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        saveToGallery();
      },
      backgroundColor: Colors.black,child: const Text('Save',style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
      ),
      body: ListView(
        children: [
          Screenshot(
            controller: _screenshotController,
            child: Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height/1,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(right: 30,left: 30,top: 30,bottom: 100),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 2,color: Colors.black),
                      // color: Colors.red,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  height: MediaQuery.of(context).size.height/1.2,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      const SizedBox(height: 23),
                      const Center(child: Text('Voucher',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                      const SizedBox(height: 23,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          minLines: null,
                          maxLines: null,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                          decoration: InputDecoration(
                            labelText: 'Sender Name',
                            hintText: 'Sender Name',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: const BorderSide(
                                width: 1,color: Colors.grey
                              )
                            ),
                            fillColor: Colors.grey,
                            hoverColor: Colors.black,
                            focusColor: Colors.black,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)
                            )
                          ),
                          ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          minLines: null,
                          maxLines: null,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                          decoration: InputDecoration(
                            labelText: 'Receiver Name',
                            hintText: 'Reciever Name',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: const BorderSide(
                                width: 1,color: Colors.grey
                              )
                            ),
                            fillColor: Colors.grey,
                            hoverColor: Colors.black,
                            focusColor: Colors.black,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)
                            )
                          ),
                          ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          minLines: null,
                          maxLines: null,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                          decoration: InputDecoration(
                            labelText: 'Sending Address',
                            hintText: 'From: "Address"',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: const BorderSide(
                                width: 1,color: Colors.grey
                              )
                            ),
                            fillColor: Colors.grey,
                            hoverColor: Colors.black,
                            focusColor: Colors.black,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)
                            )
                          ),
                          ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          minLines: null,
                          maxLines: null,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                          decoration: InputDecoration(
                            labelText: 'Receiving Address',
                            hintText: 'To: "Address"',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: const BorderSide(
                                width: 1,color: Colors.grey
                              )
                            ),
                            fillColor: Colors.grey,
                            hoverColor: Colors.black,
                            focusColor: Colors.black,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)
                            )
                          ),
                          ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          minLines: null,
                          maxLines: null,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold
                          ),
                          decoration: InputDecoration(
                              labelText: 'Fee',
                              hintText: 'Delivering Fee',
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: const BorderSide(
                                      width: 1,color: Colors.grey
                                  )
                              ),
                              fillColor: Colors.grey,
                              hoverColor: Colors.black,
                              focusColor: Colors.black,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)
                              )
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 2,color: Colors.grey
                              ),
                              borderRadius: BorderRadius.circular(50)
                            )
                          ),
                          onChanged: (v) {  },
                          hint: const Text('Choose Item Type'),
                          items: const [
                            DropdownMenuItem(
                              value: '-1',
                              child: Text('Rough Item'),
                            ),
                            DropdownMenuItem(
                              value: '1',
                              child: Text('Breakable Item'),
                            ),
                            DropdownMenuItem(
                              value: '2',
                              child: Text('Devices'),
                            ),
                            DropdownMenuItem(
                              value: '3',
                              child: Text('Clothes'),
                            ),
                          ],
                        ),
                        // child: TextFormField(
                        //   minLines: null,
                        //   maxLines: null,
                        //   style: TextStyle(
                        //     fontWeight: FontWeight.bold
                        //   ),
                        //   decoration: InputDecoration(
                        //     hintText: 'Item',
                        //     enabledBorder: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(50),
                        //       borderSide: BorderSide(
                        //         width: 1,color: Colors.grey
                        //       )
                        //     ),
                        //     fillColor: Colors.grey,
                        //     hoverColor: Colors.black,
                        //     focusColor: Colors.black,
                        //     border: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(50)
                        //     )
                        //   ),
                        //   ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          minLines: null,
                          maxLines: null,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                          decoration: InputDecoration(
                            labelText: 'Date',
                            hintText: 'D/M/Y',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: const BorderSide(
                                width: 1,color: Colors.grey
                              )
                            ),
                            fillColor: Colors.grey,
                            hoverColor: Colors.black,
                            focusColor: Colors.black,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)
                            )
                          ),
                          ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          minLines: null,
                          maxLines: null,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                          decoration: InputDecoration(
                            labelText: 'Description',
                            hintText: 'Description',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: const BorderSide(
                                width: 1,color: Colors.grey
                              )
                            ),
                            fillColor: Colors.grey,
                            hoverColor: Colors.black,
                            focusColor: Colors.black,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)
                            )
                          ),
                          ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10,),
        ],
      ),
    );
  }
}
