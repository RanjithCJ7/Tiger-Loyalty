import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';
import 'package:external_path/external_path.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tiger_loyalty/const/Image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:tiger_loyalty/screens/createLipaNamba/controller/lipna_namba_controller.dart';
import 'package:tiger_loyalty/screens/profile/model/profile_model.dart';
import 'package:tiger_loyalty/widget/loader_widget.dart';
import 'package:tiger_loyalty/widget/show_loader.dart';
import '../../../src/pages/styles.dart';

// ignore: must_be_immutable
class DownloadCode extends StatelessWidget {
  ProfileModel profileModel;
  DownloadCode({required this.profileModel});

  LipaNambaController lipaNambaController = Get.find<LipaNambaController>();
  final GlobalKey qrImageGlobalKey = GlobalKey();
  final ScreenshotController screenshotController = ScreenshotController();
  Uint8List? image;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Screenshot(
        controller: screenshotController,
        child: Obx(
          () => lipaNambaController.isLoading.value
              ? const LoaderWidget()
              : Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(size.width * 0.05),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  profileModel.businessName ?? "",
                                  style: label,
                                ),
                                const SizedBox(height: 10),
                                RepaintBoundary(
                                  key: qrImageGlobalKey,
                                  child: QrImageView(
                                    data: profileModel.rewardNumber!,
                                    version: QrVersions.auto,
                                    backgroundColor: Colors.white,
                                    size: Get.width * 0.62,
                                    embeddedImage: const AssetImage(
                                        'assets/tigersuit_sm.png'),
                                    embeddedImageStyle: QrEmbeddedImageStyle(
                                        size: Size(Get.width * 0.09,
                                            Get.height * 0.045)),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                DottedBorder(
                                  borderType: BorderType.RRect,
                                  radius: const Radius.circular(5),
                                  dashPattern: const [6, 7],
                                  color: Colors.black,
                                  strokeWidth: 1.5,
                                  child: Container(
                                    width: 263,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFCFAF4E)
                                          .withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                      child: Text(
                                        profileModel.rewardNumber!,
                                        style: numBig.copyWith(
                                          letterSpacing: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * 0.2,
                                  child: TextButton(
                                    onPressed: () {
                                      captureAndSaveAsPdf();
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10.0, bottom: 5.0),
                                          child: Image.asset(
                                              'assets/download.png'),
                                        ),
                                        Text(
                                          'save'.tr,
                                          style: resetBtnText,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 25.0),
                            width: size.width * 0.3,
                            child: TextButton(
                              style: btnGrey,
                              onPressed: () {
                                lipaNambaController
                                    .createLipaNamba(profileModel);
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: Text(
                                        'proceed'.tr,
                                        style: btnGreyText,
                                      ),
                                    ),
                                    const Icon(
                                      Icons.arrow_forward,
                                      color: Colors.black,
                                      size: 20,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              const Expanded(
                                child: Divider(
                                  color: Color(0xFF808080),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Text("or".tr, style: orText),
                              ),
                              const Expanded(
                                child: Divider(
                                  color: Color(0xFF808080),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.02),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 40.0),
                            child: Column(
                              children: [
                                Text(
                                  'download_qr_desc'.tr,
                                  style: textGrey,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: size.height * 0.03),
                                SizedBox(
                                  width: size.width * 0.5,
                                  child: TextButton(
                                    style: btnGrey,
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 8.0),
                                      child: Row(
                                        children: [
                                          Image.asset(Images.rewardTab,
                                              height: Get.height * 0.02),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 35.0),
                                            child: Text(
                                              'add_lipa_namba'.tr,
                                              style: btnGreyText,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  void generateAndSaveQR() async {
    try {
      RenderRepaintBoundary boundary = qrImageGlobalKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      final image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      await ImageGallerySaver.saveImage(
        Uint8List.fromList(pngBytes),
        name: profileModel.rewardNumber!,
      );
      Fluttertoast.showToast(msg: "saved_to_gallery".tr);
    } catch (e) {
      print("Error saving QR code: $e");
    }
  }

  Future<void> captureAndSaveAsPdf() async {
    download();
    /* try {
      var status = await Permission.storage.status;
      if (status.isPermanentlyDenied) {
        openAppSettings();
      } else if (!status.isGranted) {
        status = await Permission.storage.request();
        if (status.isGranted) {
          download();
        } else {
          openAppSettings();
        }
      } else {
        download();
      }
    } catch (e) {
      rethrow;
    } */
  }

  download() async {
    try {
      const LoaderDialog().showLoader();
      Uint8List? capturedImage = await screenshotController.capture();
      image = capturedImage;

      final pdf = pw.Document();
      pdf.addPage(
        pw.Page(
          build: (pw.Context context) {
            return pw.Image(pw.MemoryImage(image!));
          },
        ),
      );

      final output = await getExternalStorageDirectory();
      final file = File(
          '${output!.path}/${profileModel.businessName ?? "Tiger Loyalty"}_${generateRandomString(1)}.pdf');
      final pdfBytes = await pdf.save();
      await file.writeAsBytes(pdfBytes);

      var path = await ExternalPath.getExternalStoragePublicDirectory(
          ExternalPath.DIRECTORY_DOWNLOADS);
      String filePath =
          "$path/${profileModel.businessName ?? "Tiger Loyalty"}_${generateRandomString(1)}.pdf";

      File fileDef = File(filePath);
      await fileDef.create(recursive: true);
      Uint8List bytes = await file.readAsBytes();
      await fileDef.writeAsBytes(bytes);

      Fluttertoast.showToast(msg: "saved_to_gallery".tr);
      OpenFile.open(file.path);

      // final file1 = File(
      //     "$localPath/${profileController.profileModel.value.businessName ?? "Tiger Loyalty"}.pdf");
      // await file1.writeAsBytes(await pdf.save());

      const LoaderDialog().hideLoader();
    } catch (e) {
      const LoaderDialog().hideLoader();
      rethrow;
    }
  }

  String generateRandomString(int len) {
    var r = Random();
    const _chars = '1234567890';
    return List.generate(len, (index) => _chars[r.nextInt(_chars.length)])
        .join();
  }
}
