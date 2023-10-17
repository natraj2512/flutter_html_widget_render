import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';


class HtmlRenderClass extends StatelessWidget {
   HtmlRenderClass({super.key});
  String htmlContent = '''
              <h1>Just to test rendering in Flutter</h1>
              <p>Normal text</p>
              <p><em>Italic</em></p>
              <p><strong>Bold</strong></p>
              <p><em><strong>Italic Bold</strong></em></p>

              <table>
                <thead>
                  <tr><th align="left">Left</th><th align="center">center</th><th align="right">right</th></tr>
                </thead>
                <tbody>
                  <tr><td align="left">5</td><td align="center">5</td><td align="right">8</td></tr>
                  <tr><td align="left">4</td><td align="center">2</td><td align="right">8</td></tr>
                </tbody>
              </table>
              <p>Some lists:</p>
              <ul>
                <li>
                  <p>List entry one</p>
                </li>
                <li>
                  <p>List entry two</p>
                </li>
                <li>
                  <p>List entry three</p>
                  <ol>
                    <li>First</li>
                    <li>Second</li>
                    <li>Third</li>
                  </ol>
                </li>
              </ul>

              <p><span id="mainForm:JobInstructionElement_0_mark"></span></p>
              ''';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('HTML Rendering'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: HtmlWidget(htmlContent,
              customWidgetBuilder: (element) {
                if (element.localName == 'span') {
                  return  const SizedBox(
                    height: 48,
                    width: 100,
                    child:  TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                    ),
                  );
                }
                return null;
              },
            ),
          ),
        ),
      ),
    );
  }
}
