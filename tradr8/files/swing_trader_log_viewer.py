from javax.swing import JFrame, JTextArea, JScrollPane, SwingUtilities
from java.awt import BorderLayout
import java.io
import time
import threading

class TailLogFrame(JFrame):
    def __init__(self, filename):
        JFrame.__init__(self, "Tail Log")
        self.text_area = JTextArea()
        self.text_area.setEditable(False)
        self.scroll_pane = JScrollPane(self.text_area)
        self.getContentPane().add(self.scroll_pane, BorderLayout.CENTER)
        self.setSize(600, 400)
        self.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE)
        self.setVisible(True)

        self.filename = filename
        self.thread = threading.Thread(target=self.tail_f)
        self.thread.daemon = True
        self.thread.start()

    def tail_f(self):
        with open(self.filename, 'r') as f:
            f.seek(0, 2)
            while True:
                line = f.readline()
                if not line:
                    time.sleep(0.1)
                    continue
                self.append_text(line)

    def append_text(self, text):
        SwingUtilities.invokeLater(lambda: self.text_area.append(text))

if __name__ == "__main__":
    filename = "/var/log/swing_trader.log"
    SwingUtilities.invokeLater(lambda: TailLogFrame(filename))
