import sys
from PyQt5 import QtWidgets, QtGui, uic
from PyQt5.QtGui import QTextCursor
qtCreatorFile = "uav_interface.ui"  # Enter file here.

Ui_MainWindow, QtBaseClass = uic.loadUiType(qtCreatorFile)

class Window(QtWidgets.QMainWindow, Ui_MainWindow):
    def __init__(self):
        QtWidgets.QMainWindow.__init__(self)
        Ui_MainWindow.__init__(self)
        self.setupUi(self)
        #self.initUI()

def main():
    app = QtWidgets.QApplication(sys.argv)
    main = Window()
    main.show()
    sys.exit(app.exec_())

if __name__ == '__main__':
    main()
