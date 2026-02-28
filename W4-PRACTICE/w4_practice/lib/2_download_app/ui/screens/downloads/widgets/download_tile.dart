import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w4_practice/2_download_app/ui/theme/theme.dart';

import 'download_controler.dart';

class DownloadTile extends StatelessWidget {
  const DownloadTile({super.key, required this.controller});

  final DownloadController controller;

  // TODO
    String _subtitle() {
    switch (controller.status) {
      case DownloadStatus.notDownloaded:
        return "Not downloaded";

      case DownloadStatus.downloading:
        return "${(controller.progress * 100).toInt()}%";

      case DownloadStatus.downloaded:
        return "Downloaded";
    }
  }

  void _onPressed() {
    if (controller.status == DownloadStatus.notDownloaded) {
      controller.startDownload();
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO
    return ListenableBuilder(
      listenable: controller,
      builder: (context, child) {
        return ListTile(
          title: Text(controller.ressource.name),
          subtitle: Text(_subtitle()),
          trailing: controller.status== DownloadStatus.downloading?
          SizedBox(
            width: 50,
            height: 50,
          )
           : IconButton(
            onPressed: _onPressed,
            icon: Icon(controller.status.icon),
          ),
        );
      },
    );
  }
}
