import 'package:app_3tv/common/utils/color_utils.dart';
import 'package:app_3tv/common/utils/open_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';


class TextHtml extends StatelessWidget {
  const TextHtml({Key? key,required this.content, this.styleA}) : super(key: key);
  final String content;
  final Style? styleA;
  @override
  Widget build(BuildContext context) {
    return Html(
      anchorKey: GlobalKey(),
      data: content,
      style: {
        "body": Style(
          padding: HtmlPaddings.zero,
          margin: Margins(
            bottom: Margin.zero(),
            left: Margin.zero(),
            top: Margin.zero(),
            right: Margin.zero(),
          ),
        ),
        "table": Style(
          backgroundColor:
          const Color.fromARGB(0x50, 0xee, 0xee, 0xee),
        ),
        "tr": Style(
          border: const Border(
              bottom: BorderSide(color: Colors.grey)),
        ),
        "th": Style(
          backgroundColor: Colors.grey,
        ),
        "td": Style(
          alignment: Alignment.topLeft,
        ),
        'h5': Style(
            maxLines: 2,
            textOverflow: TextOverflow.ellipsis,
            fontSize: FontSize.medium),
        'h4': Style(fontSize: FontSize.large),
        'p': Style(
          padding: HtmlPaddings.zero,
          fontSize: FontSize.large,
          margin: Margins(
            bottom: Margin.zero(),
            left: Margin.zero(),
            top: Margin.zero(),
            right: Margin.zero(),
          ),
        ),
        'a': styleA ?? Style(
            fontSize: FontSize.large,
            color: ColorUtils.COLOR_PRIMARY),
        'span': Style(
          padding: HtmlPaddings.zero,
          fontSize: FontSize.large,
          margin: Margins(
            bottom: Margin.zero(),
            left: Margin.zero(),
            top: Margin.zero(),
            right: Margin.zero(),
          ),
        ),
      },
      onLinkTap: (url, _, __) {
        OpenUrl.openFile(url!);
      },
      onCssParseError: (css, messages) {
        debugPrint("css that errored: $css");
        debugPrint("error messages:");
        for (var element in messages) {
          debugPrint(element.toString());
        }
        return '';
      },
    );
  }
}
