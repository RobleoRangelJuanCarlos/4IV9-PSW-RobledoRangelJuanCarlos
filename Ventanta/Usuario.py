from io import open
class Usuario:
    def __init__(self, usuario_info, contraseña_info):
        #aquí para ocupar todo lo de herencia como no xd 
        self.__usuario = nombre
        self.__contraseña = edad
        
    def getUsuario(self):
        return self.__usuario
    
    def getContraseña(self):
        return self.__contraseña
    
    
    def setUsuario(self, nombre):
        self.__nombre = nombre
        
    def setContraseña(self, edad):
        self.__edad = edad
        

  
    #estos para guardar los datos en archivos txt por que aun no sabemos nada de base de datos
    def guarEstu(self):
        data = [self.__usuario, self.__contraseña]
        contenido = str(data)
        fichero = open("file.txt", 'a')
        fichero.write("\n" + contenido + "\n")
        fichero.close()