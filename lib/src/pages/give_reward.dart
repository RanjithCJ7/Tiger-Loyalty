import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:qr_flutter/qr_flutter.dart';
import 'package:tiger_loyalty/const/Image.dart';
import 'package:tiger_loyalty/const/my_appbar.dart';
import 'package:tiger_loyalty/screens/profile/controller/profile_controller.dart';
import 'package:tiger_loyalty/widget/loader_widget.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:screenshot/screenshot.dart';
import 'package:tiger_loyalty/widget/show_loader.dart';
import 'styles.dart';

// ignore: must_be_immutable
class GiveReward extends StatelessWidget {
  GiveReward({super.key});

  final GlobalKey qrImageGlobalKey = GlobalKey();
  ProfileController profileController = Get.find<ProfileController>();
  final ScreenshotController screenshotController = ScreenshotController();

  Uint8List? image;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: My_AppBar(context),
      body: Screenshot(
        controller: screenshotController,
        child: SafeArea(
          child: Obx(
            () => profileController.isLoading.value
                ? const LoaderWidget()
                : Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'scan_collect'.tr,
                              style: label,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: Get.height * 0.35,
                              child: RepaintBoundary(
                                key: qrImageGlobalKey,
                                child: Stack(
                                  children: [
                                    Align(
                                      child: QrImageView(
                                        data: profileController
                                            .profileModel.value.rewardNumber!,
                                        version: QrVersions.auto,
                                        backgroundColor: Colors.white,
                                        size: Get.width * 0.62,
                                        embeddedImageStyle:
                                            QrEmbeddedImageStyle(
                                          size: Size(
                                            Get.width * 0.10,
                                            Get.height * 0.05,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      child: Stack(
                                        children: [
                                          Align(
                                            child: Container(
                                              width: Get.width * 0.9,
                                              height: Get.height * 0.05,
                                              padding: const EdgeInsets.all(1),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color:
                                                      const Color(0xFFCFAF4E),
                                                  width: 1,
                                                ),
                                              ),
                                            ),
                                          ),
                                          ValueListenableBuilder(
                                              valueListenable: profileController
                                                  .notifieImage,
                                              builder: (context, value, child) {
                                                return Align(
                                                  child: Container(
                                                    width: Get.width * 0.97,
                                                    height: Get.height * 0.047,
                                                    margin:
                                                        const EdgeInsets.all(2),
                                                    padding:
                                                        const EdgeInsets.all(1),
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image: profileController
                                                                  .profileModel
                                                                  .value
                                                                  .image !=
                                                              null
                                                          ? DecorationImage(
                                                              image: MemoryImage(
                                                                  profileController
                                                                      .profileImageURL
                                                                      .bodyBytes),
                                                              fit: BoxFit
                                                                  .contain,
                                                            )
                                                          : DecorationImage(
                                                              image: AssetImage(
                                                                Images.profile,
                                                              ),
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(Get.height * 0.04),
                              child: Row(
                                children: [
                                  const Expanded(
                                    child: Divider(
                                      color: Color(0xFF808080),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: Text(
                                      "or".tr,
                                      style: orText,
                                    ),
                                  ),
                                  const Expanded(
                                    child: Divider(
                                      color: Color(0xFF808080),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Get.width * 0.04),
                              child: Text(
                                '${"enter".tr} ${profileController.profileModel.value.businessName ?? ""} ${"reward_namba".tr}',
                                style: textGrey,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.03,
                            ),
                            SizedBox(
                              width: size.width * 0.6,
                              child: Text(
                                profileController
                                    .profileModel.value.rewardNumber!,
                                textAlign: TextAlign.center,
                                style: numBig.copyWith(
                                  letterSpacing: 15,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.03,
                            ),
                            TextButton(
                              onPressed: () {
                                // generateAndSaveQR();
                                captureAndSaveAsPdf();
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10.0, bottom: 5.0),
                                    child: Image.asset('assets/download.png'),
                                  ),
                                  Text(
                                    'download'.tr,
                                    style: resetBtnText,
                                  ),
                                ],
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
    );
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
          '${output!.path}/${profileController.profileModel.value.businessName ?? "Tiger Loyalty"}_${generateRandomString(1)}.pdf');
      final pdfBytes = await pdf.save();
      await file.writeAsBytes(pdfBytes);

      var path = await ExternalPath.getExternalStoragePublicDirectory(
          ExternalPath.DIRECTORY_DOWNLOADS);
      String filePath =
          "$path/${profileController.profileModel.value.businessName ?? "Tiger Loyalty"}_${generateRandomString(1)}.pdf";

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

  /* download() async {
    const LoaderDialog().showLoader();
    Uint8List? imageBytes = await screenshotController.capture();
    final pdf = pw.Document();
    final image = pw.MemoryImage(imageBytes!);

    pdf.addPage(pw.Page(
      build: (pw.Context context) {
        return pw.Center(child: pw.Image(image));
      },
    ));

    final file = File(
        "/storage/emulated/0/Download/${profileController.profileModel.value.businessName ?? "Tiger Loyalty"}.pdf");
    await file.writeAsBytes(await pdf.save());
    const LoaderDialog().hideLoader();
    Fluttertoast.showToast(msg: "saved_to_gallery".tr);
  } */
}
