from Persona import Persona
from tkinter import *
from tkinter import ttk
from tkinter import messagebox as MessageBox
import re
from io import open
class Registro(Toplevel):
    def __init__(self, master):
        self.master = master
        master.title("Registro Profesores y Alumnos con herencia")
        master.geometry('800x573')
        #el titulo y su estilo
        self.titulo = Label()
        self.titulo.pack(anchor = CENTER)
        self.titulo.config(text="REGISTRO PROFESOR Y ALUMNO", fg = "#b21f66", bg = "#ff7c7c",font = ("Arial", 25))
        #el css de las instrucciones y pues rosita todo por que se ve bonitoo
        self.ins = Label()
        self.ins.pack(anchor = CENTER)
        self.ins.config(text="Por fa, presione un boton para proseguir con el registro de un alumno o un profesor", fg = "#1b262c", bg = "#ff7c7c",font = (" Fantasque Sans Mono", 15))

        self.estu = Button(master, text = "Alumnno", command = self.ac_es)
        self.estu.place(x= 580, y = 90, width = 140, height = 60)
        self.estu.config(fg = "#1b262c", font = ("Verdana", 17), bg ="#ea728c")

        self.pro = Button(master, text = "Profesor", command = self.ac_pr)
        self.pro.place(x = 70, y = 90, width= 140, height=60)
        self.pro.config(fg = "#1b262c", font = ("Verdana", 17), bg ="#ea728c")
        #Dejo esto aquí por que no sé por que me marca error si lo quiero poner con los otros ):, atyuda
        self.nombre = Label()
        self.nombre.place(x = 90, y= 200)
        self.nombre.config(text = "Nombre:", fg = "black", bg = "#ff7c7c",font = ("Verdana", 17))
        #Y este otro es para que guarde o "registre" los datos
        self.reg = Button(master, text="Registrar", command=self.ac_re)
        self.reg.place(x=70, y = 430, width= 160, height=72)
        self.reg.config(fg = "#161925", font = ("Verdana", 17), bg ="#ea728c")
        #Esto es para consultar los datos que metiste en los campos, los de un profesor o alumno
        self.cam = Button(master, text = "Consulta", command = self.ac_co)
        self.cam.place(x = 580, y=430, width = 160, height = 72)
        self.cam.config(fg = "#161925", font = ("Verdana", 17), bg ="#ea728c")
        #declaracion de variables para etiquetas
        self.uno = StringVar()
        self.uno.set("Boleta: ")
        
        self.dos = StringVar()
        self.dos.set("Grupo: ")

        self.tres = StringVar()
        self.tres.set("Edad: ")

        #esto para el diseño de los botones de datos 
        self.boleta = Label()
        self.boleta.place(x = 90, y= 250)
        self.boleta.config(textvariable = self.uno, fg = "black", bg = "#ff7c7c",font = ("Verdana", 17))

        self.grupo = Label()
        self.grupo.place(x = 90, y = 300)
        self.grupo.config(textvariable = self.dos, fg = "black", bg = "#ff7c7c",font = ("Verdana", 17))

        self.edad = Label()
        self.edad.place(x=90, y=350)
        self.edad.config(textvariable = self.tres, fg = "black", bg = "#ff7c7c",font = ("Verdana", 17))
        #hay que declarar variables 
        self.n = StringVar()
        self.b = StringVar()
        self.g = StringVar()
        self.e = StringVar()

        self.primero = Entry(textvariable = self.n)
        self.primero.place(x= 520, y = 200, width = 250, height = 30)

        self.segundo = Entry(textvariable = self.b)
        self.segundo.place(x = 520, y = 250, width = 250, height = 30)

        self.tercero = Entry(textvariable = self.g)
        self.tercero.place(x = 520, y = 300, width = 250, height = 30)

        self.cuarto = Entry(textvariable = self.e)
        self.cuarto.place(x=520, y = 350, width=250, height=30)

        #Estas son las variables de control para los botonesxd
        self.Un = True
        self.Do = False
    def ac_es(self):
        self.uno.set("Boleta: "); self.dos.set("Grupo"); self.tres.set("Edad")
        self.Un = True
        self.Do = False
    def ac_pr(self):
        self.uno.set("Materia: "); self.dos.set("Grupos"); self.tres.set("Horas")
        self.Un = False
        self.Do = True
    def ac_re(self):
        self.vari =self.n.get()
        self.va = self.b.get()
        self.v = self.g.get()
        self.u = self.e.get()
        patron1 = re.compile(r'\D{3,30}')
        patron2 = re.compile(r'\d{1,3}')
        patron3 = re.compile(r'\w{4,15}')
        
        self.numero = 0
        if(patron1.match(self.vari)):
            self.numero += 1
        else:
            MessageBox.showinfo("Uy, advertencia ):", "Ingrese un nombre válido, porfa")
            self.numero=0
        if(patron3.match(self.va)):
            self.numero += 1
        else:
            MessageBox.showinfo("Uy, advertencia ):", "Ingrese un dato válido en el campo 2, porfa")
            self.numero=0
        if(patron3.match(self.v)):
            self.numero +=1
        else:
            MessageBox.showinfo("Uy,advertencia ):", "Ingrese un grupo válido, porfa ")
            self.numero=0
        if(patron2.match(self.u)):
            self.numero +=1
        else:
            MessageBox.showinfo("Uy, advertencia ):", "Ingrese un dato válido en el campo 4, porfa")
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
        self.mostrar.etiqueta.config(text = "Alumnos (arriba) y Profesores (abajo)", fg = "black", bg = "#ff7c7c",font = ("Verdana", 17))
        
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
miVentana = Registro(root)
root.mainloop()