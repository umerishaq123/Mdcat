import 'package:mdcat_kawiish/config/constants/api_links.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../all_imports.dart';

class PDFViewerScreen extends StatelessWidget {
  final String pdfUrl;

  const PDFViewerScreen({super.key, required this.pdfUrl});
  @override
  Widget build(BuildContext context) {
    var url = '${Applinks.baseUrl}/$pdfUrl';
    return Scaffold(
      appBar: AppBar(
        title: const Text("PDF Viewer"),
      ),
      body: SfPdfViewer.network(url),
    );
  }
}
