# basic graphical calculator for testing Jython installation and X forwarding

from javax.swing import JFrame, JButton, JTextField, JLabel, JOptionPane
from java.awt import Font
from java.awt.event import ActionListener

class Calculator(ActionListener):
    def __init__(self):
        # Create JFrame
        self.frame = JFrame("Simple Calculator")
        self.frame.setSize(300, 400)
        self.frame.setLayout(None)
        self.frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE)

        # Create text field for displaying numbers
        self.text_field = JTextField("")
        self.text_field.setBounds(10, 10, 270, 50)
        self.text_field.setFont(Font("Arial", Font.PLAIN, 20))
        self.text_field.setEditable(False)
        self.frame.add(self.text_field)

        # Create number buttons
        self.buttons = []
        for i in range(10):
            button = JButton(str(i), actionPerformed=self.number_clicked)
            button.setBounds((i % 3) * 90 + 10, (i // 3) * 60 + 80, 80, 50)
            self.buttons.append(button)
            self.frame.add(button)

        # Create operator buttons
        operators = ['+', '-', '*', '/']
        for i, op in enumerate(operators):
            button = JButton(op, actionPerformed=self.operator_clicked)
            button.setBounds(200, i * 60 + 80, 80, 50)
            self.buttons.append(button)
            self.frame.add(button)

        # Create equals and clear buttons
        equals_button = JButton("=", actionPerformed=self.equals_clicked)
        equals_button.setBounds(10, 320, 180, 50)
        self.frame.add(equals_button)
        self.buttons.append(equals_button)

        clear_button = JButton("C", actionPerformed=self.clear_clicked)
        clear_button.setBounds(200, 320, 80, 50)
        self.frame.add(clear_button)
        self.buttons.append(clear_button)

        # Display the JFrame
        self.frame.setVisible(True)

        # Initialize calculator variables
        self.reset()

    def actionPerformed(self, event):
        pass

    def number_clicked(self, event):
        source = event.getSource()
        self.current_input += source.getText()
        self.update_display()

    def operator_clicked(self, event):
        source = event.getSource()
        self.operator = source.getText()
        if self.current_input != "":
            self.first_operand = float(self.current_input)
            self.current_input = ""
            self.update_display()

    def equals_clicked(self, event):
        if self.current_input != "":
            self.second_operand = float(self.current_input)
            result = self.calculate()
            self.text_field.setText(str(result))
            self.reset()

    def clear_clicked(self, event):
        self.reset()
        self.update_display()

    def calculate(self):
        if self.operator == '+':
            return self.first_operand + self.second_operand
        elif self.operator == '-':
            return self.first_operand - self.second_operand
        elif self.operator == '*':
            return self.first_operand * self.second_operand
        elif self.operator == '/':
            if self.second_operand != 0:
                return self.first_operand / self.second_operand
            else:
                JOptionPane.showMessageDialog(self.frame, "Cannot divide by zero!")
                self.reset()
                return 0

    def reset(self):
        self.first_operand = 0
        self.second_operand = 0
        self.current_input = ""
        self.operator = ""
        self.text_field.setText("")

    def update_display(self):
        self.text_field.setText(self.current_input)

if __name__ == "__main__":
    Calculator()
