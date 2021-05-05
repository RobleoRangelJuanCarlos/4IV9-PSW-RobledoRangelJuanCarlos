from Usuario import Usuario
from tkinter import *
from tkinter import ttk
from tkinter import messagebox as MessageBox
import re
from io import open

class Sesion:
    def __init__(self, master):

        self.master = master
        master.title("Login")
        master.geometry('700x450')

        self.etiqueta1 = Label()
        self.etiqueta1.pack(anchor = CENTER)
        self.etiqueta1.config(text="LOGIN", fg = "#b21f66", bg = "#ff7c7c",font = ("Arial", 25))



        self.uno = StringVar()
        self.uno.set("Usuario: ")
        
        self.dos = StringVar()
        self.dos.set("Contraseña: ")



        self.usuariop = Label()
        self.usuariop.place(x=150,y=150)
        self.usuariop.config(textvariable = self.uno, fg = "black", bg = "#ff7c7c",font = ("Verdana", 17))

        self.contraseñap = Label()
        self.contraseñap.place(x=150,y=220)
        self.contraseñap.config(textvariable = self.dos, fg = "black", bg = "#ff7c7c",font = ("Verdana", 17))


        
        self.boton3 = Button(master, text="Iniciar", command=self.openWindow)
        self.boton3.place(x=170, y = 290, width= 160, height=72)
        self.boton3.config(fg = "#161925", font = ("Verdana", 13), bg ="#ff7c7c")

        self.boton2 = Button(master, text="Registrarse", command=self.registro)
        self.boton2.place(x=350, y = 290, width= 160, height=72)
        self.boton2.config(fg = "#161925", font = ("Verdana", 13), bg ="#ff7c7c")
        

        self.boton1 = Button(master, text="Datos", command = self.ac_co)
        self.boton1.place(x=270, y = 380, width= 160, height=50)
        self.boton1.config(fg = "#161925", font = ("Verdana", 13), bg ="#ff7c7c")


#__________________________________________________________________________________________________________________________
        

        self.n = StringVar()
        self.b = StringVar()





        self.primero = Entry(textvariable = self.n)
        self.primero.place(x= 350, y = 160)

        self.segundo = Entry(textvariable = self.b, show="*")
        self.segundo.place(x = 350, y = 230)


        #Estas son las variables de control para los botonesxd
        self.Un = True
        self.Do = False
    def ac_es(self):
        self.uno.set("Usuario: "); self.dos.set("Contraseña")
        self.Un = True
        self.Do = False
    def ac_re(self):
        self.vari =self.n.get()
        self.va = self.b.get()
        patron1 = re.compile(r'\D{3,30}')
        patron2 = re.compile(r'\d{1,3}')
        patron3 = re.compile(r'\w{4,15}')

    def registro(self):
        usuario_info = self.n.get()
        contraseña_info = self.b.get()
        print(usuario_info,"\t", contraseña_info)
        
        
 
#  Open and write data to a file
        file = open("user.txt", "a")
        file.write(usuario_info)
        file.write("\t")
        file.write(contraseña_info)
        file.write("\t\n")
        file.close()
        print(" New user registered. usuario: {} | contraseña: {}   ".format(usuario_info, contraseña_info))
        MessageBox.showinfo("Usuario registrado con exito")


    def openWindow(self):
        newWindow = Toplevel(master)
        
        self.numero = 0
        if(patron1.match(self.vari)):
            self.numero += 1
        else:
            MessageBox.showinfo("Ingrese un valor valido")
            self.numero=0
        if(patron3.match(self.va)):
            self.numero += 1
        else:
            MessageBox.showinfo("Valor no valido en el campo 2")
            self.numero=0
        if(patron3.match(self.v)):
            self.numero +=1
        else:
            MessageBox.showinfo("Ingrese un valor valido")
            self.numero=0
        if(patron2.match(self.u)):
            self.numero +=1
        else:
            MessageBox.showinfo("Valor no valido en el campo 4")
            self.numero=0

        if(self.numero == 4):
            if(self.Un == True):
                self.guard = Persona(self.vari, self.va, self.v, self.u)
                self.guard.guarEstu()
            if(self.Do == True):
                self.guard2 = Persona(self.vari, self.va, self.v, self.u)
                self.guard2.guarProf()
        
    def ac_co(self):
        self.mostrar = Toplevel()
        self.mostrar.geometry('500x500')
        self.mostrar.configure(background = "#ff7c7c")
        self.mostrar.etiqueta = Label(self.mostrar)
        self.mostrar.etiqueta.place(x = 20, y = 20)
        self.mostrar.etiqueta.config(text = "Registro de cuentas", fg = "black", bg = "#ff7c7c",font = ("Verdana", 17))
        
        self.etiq = Label(self.mostrar)
        self.etiq.place(x=10, y = 250)
        self.etiq.config(text = "Profesores", fg = "black", bg = "#ff7c7c",font = ("Verdana", 17))

        self.le = Text(self.mostrar)
        self.le.place(x=10, y = 60)
        self.le.config(fg = "black", bg = "#ff7c7c",font = ("Verdana", 17))

        fichero = open("file.txt", 'r+')
        contenido = fichero.read()
        self.le.delete(1.0,'end')
        self.le.insert('insert', contenido)
        fichero.close()

        self.le2 = Text(self.mostrar)
        self.le2.place(x=10, y = 320)
        self.le2.config(fg = "black", bg = "#ff7c7c", font = ("Verdana", 17))
        
        fichero2 = open("file2.txt", 'r+')
        contenido2 = fichero2.read()
        self.le2.delete(1.0,'end')
        self.le2.insert('insert', contenido2)
        fichero2.close()

        self.mostrar.resizable(False, False)


root = Tk()
root.resizable(False, False)
root.configure(background = "#ff7c7c")
miVentana = Sesion(root)
root.mainloop()
