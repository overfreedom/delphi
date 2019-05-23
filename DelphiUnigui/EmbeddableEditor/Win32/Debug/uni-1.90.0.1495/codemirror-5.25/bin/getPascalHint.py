# with open('f:\\PreDefSymbols.xml','r') as f:
#   line = f.readline()
#   while line:
#     print(line)
#     line = f.readline()

import xml.sax


class XmlHandler(xml.sax.ContentHandler):
    def __init__(self):
        self.line = ''

    def startElement(self, tag, attributes):
        self.CurrentData = tag

     # 元素结束事件处理
    def endElement(self, tag):
        if self.CurrentData == "Name":
            self.line =  self.line +",'"+ self.Name +"'"

         # 内容事件处理
    def characters(self, content):
        if self.CurrentData == "Name":
            self.Name = content


if __name__ == "__main__":
    paser = xml.sax.make_parser()
    paser.setFeature(xml.sax.handler.feature_namespaces, 0)
    Handler = XmlHandler()
    paser.setContentHandler(Handler)
    paser.parse('f:\\PreDefSymbols.xml')
    print(Handler.line)  