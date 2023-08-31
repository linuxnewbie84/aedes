import cv2
from uuid import uuid4
from fastapi.responses import HTMLResponse

ruta = 'huevesillos/resultados/'
class img:
    def __init__(self, f):
        self.f = f
        
    def trar(self):
        huevr = cv2.imread(self.f)
        #* Cargar imagen
        
        #cv2.imshow("Original", huevr)
         
        
        esca = cv2.cvtColor(huevr, cv2.COLOR_BGR2GRAY)
        
        #*Gaussiano
        
        gaus = cv2.GaussianBlur(esca, (5,5), 0)
        
        #*Mostramos
        
        #cv2.imshow("Escalas y Gauss", gaus)
        
        #*Bordes
        
        borde = cv2.Canny(gaus, 25, 70)
        
        #cv2.imshow("Bordes", borde)
        (contornos,_) = cv2.findContours(borde.copy(), cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
        
        #cv2.imwrite(ruta, huevr, )
        
        print("He encontrado {} huevesillos de Aedes Aegypti".format(len(contornos)))
        
        cv2.drawContours(huevr,contornos,-1,(0,0,255), 2)
        nom = f"{uuid4()}.jpg"
        cv2.imwrite(ruta+nom, huevr)
        return HTMLResponse("""<h1>La imagen ha sido procesada y guardada con el nombre: {},</h1> 
<h2>Y se han encontrado *{}* huevesillos del Mosquito Aedes Aegyptip </h2>""".format(nom,len(contornos)))
        #cv2.imshow("contornos", huevr)
        #cv2.waitKey(100)
        #cv2.destroyAllWindows()

