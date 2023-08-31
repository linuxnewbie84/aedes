import cv2
from uuid import uuid4
from fastapi.responses import HTMLResponse

ruta = 'huevesillos/imagenr/'
class im :
    def __init__(self, f:str):
        self.f = f
    
    def wather(self):
        huevos = cv2.imread(self.f)
        